class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.integer :first_user_id
      t.integer :second_user_id

      t.timestamps
    end
  end
end
