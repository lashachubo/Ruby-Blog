class AddUserIdColumnToListing < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :user_id, :integer
  end
end
