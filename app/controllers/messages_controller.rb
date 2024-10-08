class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /messages or /messages.json
  def index
    conversation_id = params[:conversation_id]
    @conversation = Conversation.find(conversation_id)
    @messages = Message.all if conversation_id.nil?
    @messages = @conversation.messages.map{|m| m.to_broadcast(current_user.id)}
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    Rails.logger.info params
    conversation_id = params[:conversation_id]
    conversation = Conversation.find(conversation_id)
    @message = conversation.messages.create!(content: message_params['content'], sender_id: current_user.id )
    Rails.logger.info(@message)
    ActionCable.server.broadcast("message_channel", @message.to_broadcast(current_user.id))
    client = Gemini.new(
      credentials: {
        service: 'generative-language-api',
        api_key: 'AIzaSyDlJDAQtakKYDvCg5XlgPLDS3OQbIRfuoA'
      },
      options: { model: 'gemini-pro', server_sent_events: true }
    )
    result = client.generate_content({ contents: { role: 'user', parts: { text: "create a one sentence response to this messege: '#{message_params['content']}'" } } })
    ai_message = conversation.messages.create!(content: result['candidates'][0]['content']['parts'][0]['text'], sender_id: current_user.id)
    ActionCable.server.broadcast("message_channel", OpenStruct.new(content: ai_message.content, from_current_user: false))
    head :ok
    rescue StandardError => e
      Rails.logger.info e.message
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:sender_id, :content, :conversation_id)
    end
end
