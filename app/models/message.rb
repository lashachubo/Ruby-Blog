class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :conversation
  def to_broadcast(user_id)
    OpenStruct.new(content: content, from_current_user: sender_id == user_id)
  end
end
