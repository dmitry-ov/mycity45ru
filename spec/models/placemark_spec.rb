require 'spec_helper'

describe Placemark do
  before(:each) do

    @valid_attributes = {
      :kind => 'Открытый люк', 
      :adress => 'ул.Пушкина д.5', 
      :geopoint =>'65.335706,55.416408', 
      :description => 'Описание', 
      :foto => '/public/rails.png'
     }
  
    PATH_TO_XML =  RAILS_ROOT + "/public/simpleobject.xml"


    @placemark_full = Placemark.new(  :kind => 'Яма',
                                     :adress =>'Куйбышева 137а',
                                     :geopoint =>'65.309613,55.398437',
                                     :description => 'Длинное-длинное описание',
                                     :foto => '/public/rails.png' ) 

   end

  it "should create a new instance given valid attributes" do
    Placemark.create!(@valid_attributes)
  end
  
  it "should not save empty in base" do 
   @empty_placemark = Placemark.new()    
   @empty_placemark.save.should be_false 
  end
 
  it "should save placemarks with all attributes " do
   @placemark_full.save!.should  be_true
  end 
  
  it "should add to xml data from placemark attribute" do
   file_begin = File.open( PATH_TO_XML , 'r'){ |file| file.read }
     @placemark_full.add_to_xml()
   file_end = File.open( PATH_TO_XML , 'r'){ |file| file.read }
  (file_end.size > file_begin.size).should be_true  
  end

end
