class AddHouseToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :house, foreign_key: true
  end
end
