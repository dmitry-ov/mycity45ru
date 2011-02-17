require "rexml/document"

class Placemark < ActiveRecord::Base

  belongs_to :category

  PATH_TO_XML =  RAILS_ROOT + "/public/simpleobject.xml" 
  
  validates_presence_of  :geopoint, :category_id, :category 


  def add_to_xml_text xml_text
        
        doc = REXML::Document.new xml_text 
        feature_members = REXML::XPath.first( doc, "//gml:featureMembers" )
        
        geo_object_element = REXML::Element.new "ymaps:GeoObject" 
        feature_members.add_element  geo_object_element

        #~ gml:name  - Название метки
        gml_name_element  =  REXML::Element.new "gml:name"
        #gml_name_element.text = self.kind  #
           unless self.category?
            gml_name_element.text = nil 
           else 
            gml_name_element.text = self.category.name 
           end
          geo_object_element.add_element  gml_name_element

          #~ gml:description  -  Описание метки 
          gml_description_element  = REXML:: Element.new "gml:description"
          gml_description_element.text = self.description #
          geo_object_element.add_element  gml_description_element 
        
          #~ gml:Point  - Позиция на карте 
          gml_point_element = REXML::Element.new "gml:Point"
          geo_object_element.add_element  gml_point_element

          #~ gml:pos
          str = self.geopoint 
          str[ str.index(',').to_i ] = ' '
        
          gml_pos_element = REXML::Element.new "gml:pos"
          gml_pos_element.text = str
          gml_point_element.add_element  gml_pos_element

        xml_text =  doc.to_s
        
        return xml_text

  end


end

