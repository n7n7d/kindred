class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.string :location
      t.float :price
      t.string :type
      t.text :address
      t.boolean :listing_display
      t.string :status
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
