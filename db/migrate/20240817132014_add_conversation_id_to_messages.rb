class AddConversationIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :conversation_id, :integer
    add_column :messages, :conversation_index, :integer
  end
end
