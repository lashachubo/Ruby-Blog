class Conversation < ApplicationRecord
  has_many :messages
  def other_user_id(user_id)
    [first_user_id, second_user_id].find{|m| m != user_id}
  end
end
