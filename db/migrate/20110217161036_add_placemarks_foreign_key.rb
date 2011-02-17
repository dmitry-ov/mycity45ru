class AddPlacemarksForeignKey < ActiveRecord::Migration
  def self.up
   add_column :placemarks, :category,:integer
  end

  def self.down
  remove_column :placemarks, :category 
  end
end
