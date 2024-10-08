class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.string :title
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
