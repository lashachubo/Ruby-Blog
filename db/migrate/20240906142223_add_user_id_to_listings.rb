class AddUserIdToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :user_id, :integer
  end
end
