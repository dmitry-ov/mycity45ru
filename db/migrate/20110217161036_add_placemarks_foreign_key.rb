class AddPlacemarksForeignKey < ActiveRecord::Migration
  def self.up
   add_column :placemarks, :category_id,:integer
  end

  def self.down
  remove_column :placemarks, :category_id 
  end
end
