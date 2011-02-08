class PlacemarksController < ApplicationController
  # GET /placemarks
  # GET /placemarks.xml


  def index
=begin
    @placemarks = Placemark.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @placemarks }
    end
=end
  end


# Специально для сервиса Яндекс-Карты генерим XML  
  def yml
     path_xml = RAILS_ROOT + "/public/simpleobject.xml"
     xml_text = File.open( path_xml , 'r'){ |file| file.read }
       Placemark.all.each  do  |placemark|
        xml_text = placemark.add_to_xml_text( xml_text)
       end
    render :xml => xml_text 
  end

  
  def yml_auth
     path_xml = RAILS_ROOT + "/public/simpleobject.xml"
     xml_text = File.open( path_xml , 'r'){ |file| file.read }
       Placemark.all.each  do  |placemark|
       placemark.description += "<p><a href=http://78.108.78.166/placemarks/#{placemark.id}/edit>Редактировать метку</a></p>" 
       xml_text = placemark.add_to_xml_text( xml_text)
       end
    render :xml => xml_text 
  end



  # GET /placemarks/1
  # GET /placemarks/1.xml
  def show
    @placemark = Placemark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @placemark }
    end
  end

  # GET /placemarks/new
  # GET /placemarks/new.xml
  def new
    @placemark = Placemark.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @placemark }
    end
  end

  # GET /placemarks/1/edit
  def edit
     if logged_in? 
       @placemark = Placemark.find(params[:id])
     else 
       #render :status => :forbidden
       render :text => "500"
     end
  end

  # POST /placemarks
  # POST /placemarks.xml
  def create
    @placemark = Placemark.new(params[:placemark])

#    @placemark.description += "<a href='ya.ru'>"   

    respond_to do |format|
      if @placemark.save
 #        @placemark.add_to_xml
        format.html { redirect_to(@placemark, :notice => 'Placemark was successfully created.') }
        format.xml  { render :xml => @placemark, :status => :created, :location => @placemark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @placemark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /placemarks/1
  # PUT /placemarks/1.xml
  def update
    @placemark = Placemark.find(params[:id])

    respond_to do |format|
      if @placemark.update_attributes(params[:placemark])
        format.html { redirect_to(@placemark, :notice => 'Placemark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @placemark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /placemarks/1
  # DELETE /placemarks/1.xml
  def destroy
    @placemark = Placemark.find(params[:id])
    @placemark.destroy

    respond_to do |format|
      format.html { redirect_to(placemarks_url) }
      format.xml  { head :ok }
    end
  end
end
