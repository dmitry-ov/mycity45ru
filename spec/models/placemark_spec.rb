require 'spec_helper'

describe Placemark do
  before(:each) do
    @valid_attributes = {
     }
  
    @empty_placemark = Placemark.new()
    
    @placemark_full = Placemark.new( :kind => 'Яма',
                                     :adress =>'Куйбышева 137а',
                                     :geopoint =>'65.309613,55.398437',
                                     :description => 'Длинное-длинное описание' ) 

  end

  it "should create a new instance given valid attributes" do
    Placemark.create!(@valid_attributes)
  end
  
  it "should not save empty in base" do 
    unless @empty_placemark.save 
       true
    end
  end
 
  it "should save placemarks with all attributes " do
     @placemark_full.save   
  end 
  
  it "should add to xml data from placemark attribute" do
    @placemark_full.add_to_xml() 
  end 

end
