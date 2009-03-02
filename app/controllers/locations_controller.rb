class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    location_params = params[:location].dup
    parent_id = params[:location].delete(:parent_id)
    @parent = Location.find(parent_id) if parent_id
    
    outgoing_id = params[:location].delete(:outgoing_id)
    @outgoing = Location.find(outgoing_id) if outgoing_id
    
    incoming_id = params[:location].delete(:incoming_id)
    @incoming = Location.find(incoming_id) if incoming_id
    
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created. with params ' + location_params.inspect
        @location.move_to_child_of @parent if @parent
        LocationGraphEdge.create(:location1 => @outgoing, :location2 => @location) if @outgoing
        LocationGraphEdge.create(:location1 => @location, :location2 => @incoming) if @incoming
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /locations/new_sublocation
  # GET /locations/new_sublocation.xml
  def new_sublocation
    @parent_location = Location.find(params[:id])
    @location = Location.new

    respond_to do |format|
      format.html { render :action => "new" }
      format.xml  { render :xml => @location }
    end
  end
  
  # GET /locations/new_outgoing_location
  # GET /locations/new_outgoing_location.xml
  def new_outgoing_location
    @outgoing_location = Location.find(params[:id])
    @location = Location.new

    respond_to do |format|
      format.html { render :action => "new" }
      format.xml  { render :xml => @location }
    end
  end
end
