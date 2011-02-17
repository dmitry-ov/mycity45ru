class CreatePlacemarks < ActiveRecord::Migration
  def self.up
    create_table :placemarks do |t|
      t.string :adress
      t.string :geopoint
      t.text :description
      t.string :foto

      t.timestamps
    end
  end

  def self.down
    drop_table :placemarks
  end
end
