class WorldsController < ApplicationController
  # GET /worlds
  # GET /worlds.xml
  def index
    @worlds = World.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @worlds }
    end
  end

  # GET /worlds/1
  # GET /worlds/1.xml
  def show
    @world = World.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @world }
    end
  end

  # GET /worlds/new
  # GET /worlds/new.xml
  def new
    @world = World.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @world }
    end
  end

  # GET /worlds/1/edit
  def edit
    @world = World.find(params[:id])
  end

  # POST /worlds
  # POST /worlds.xml
  def create
    @world = World.new(params[:world])

    respond_to do |format|
      if @world.save
        flash[:notice] = 'World was successfully created.'
        format.html { redirect_to(@world) }
        format.xml  { render :xml => @world, :status => :created, :location => @world }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @world.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /worlds/1
  # PUT /worlds/1.xml
  def update
    @world = World.find(params[:id])

    respond_to do |format|
      if @world.update_attributes(params[:world])
        flash[:notice] = 'World was successfully updated.'
        format.html { redirect_to(@world) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @world.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /worlds/1
  # DELETE /worlds/1.xml
  def destroy
    @world = World.find(params[:id])
    @world.destroy

    respond_to do |format|
      format.html { redirect_to(worlds_url) }
      format.xml  { head :ok }
    end
  end
end
