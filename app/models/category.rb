class Category < ActiveRecord::Base
  has_many :placemarks
end
