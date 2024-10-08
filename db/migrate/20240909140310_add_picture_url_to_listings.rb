class AddPictureUrlToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :picture_url, :string
  end
end