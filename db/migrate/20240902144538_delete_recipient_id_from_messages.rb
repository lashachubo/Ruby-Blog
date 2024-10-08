class DeleteRecipientIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages,  :recipient_id
    remove_column :conversations,  :second_user_id
  end
end
