require "rexml/document"

class Placemark < ActiveRecord::Base


   PATH_TO_XML =  "/home/d/src/mycity45ru/public/simpleobject.xml" 

  def add_to_xml
        file = File.open( PATH_TO_XML , 'r'){ |file| file.read }
        doc = REXML::Document.new file
        feature_members = REXML::XPath.first( doc, "//gml:featureMembers" )
        
        geo_object_element = REXML::Element.new "ymaps:GeoObject" 
        feature_members.add_element  geo_object_element

        #~ gml:name
        gml_name_element  =  REXML::Element.new "gml:name"
        gml_name_element.text = self.kind  #
        geo_object_element.add_element  gml_name_element
       
        #~ gml:description
        gml_description_element  = REXML:: Element.new "gml:description"
        gml_description_element.text = self.description #
        geo_object_element.add_element  gml_description_element 
        
        #~ gml:Point 
        gml_point_element = REXML::Element.new "gml:Point"
        geo_object_element.add_element  gml_point_element

        #~ gml:pos
        str = self.geopoint 
        str[ str.index(',').to_i ] = ' '
        
        gml_pos_element = REXML::Element.new "gml:pos"
        gml_pos_element.text = str
        gml_point_element.add_element  gml_pos_element

        File.open( PATH_TO_XML , 'w'){ |file| file.write doc.to_s }

   end 

end
