require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WorldsController do

  def mock_world(stubs={})
    @mock_world ||= mock_model(World, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all worlds as @worlds" do
      World.should_receive(:find).with(:all).and_return([mock_world])
      get :index
      assigns[:worlds].should == [mock_world]
    end

    describe "with mime type of xml" do
  
      it "should render all worlds as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        World.should_receive(:find).with(:all).and_return(worlds = mock("Array of Worlds"))
        worlds.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested world as @world" do
      World.should_receive(:find).with("37").and_return(mock_world)
      get :show, :id => "37"
      assigns[:world].should equal(mock_world)
    end
    
    describe "with mime type of xml" do

      it "should render the requested world as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        World.should_receive(:find).with("37").and_return(mock_world)
        mock_world.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new world as @world" do
      World.should_receive(:new).and_return(mock_world)
      get :new
      assigns[:world].should equal(mock_world)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested world as @world" do
      World.should_receive(:find).with("37").and_return(mock_world)
      get :edit, :id => "37"
      assigns[:world].should equal(mock_world)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created world as @world" do
        World.should_receive(:new).with({'these' => 'params'}).and_return(mock_world(:save => true))
        post :create, :world => {:these => 'params'}
        assigns(:world).should equal(mock_world)
      end

      it "should redirect to the created world" do
        World.stub!(:new).and_return(mock_world(:save => true))
        post :create, :world => {}
        response.should redirect_to(world_url(mock_world))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved world as @world" do
        World.stub!(:new).with({'these' => 'params'}).and_return(mock_world(:save => false))
        post :create, :world => {:these => 'params'}
        assigns(:world).should equal(mock_world)
      end

      it "should re-render the 'new' template" do
        World.stub!(:new).and_return(mock_world(:save => false))
        post :create, :world => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested world" do
        World.should_receive(:find).with("37").and_return(mock_world)
        mock_world.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :world => {:these => 'params'}
      end

      it "should expose the requested world as @world" do
        World.stub!(:find).and_return(mock_world(:update_attributes => true))
        put :update, :id => "1"
        assigns(:world).should equal(mock_world)
      end

      it "should redirect to the world" do
        World.stub!(:find).and_return(mock_world(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(world_url(mock_world))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested world" do
        World.should_receive(:find).with("37").and_return(mock_world)
        mock_world.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :world => {:these => 'params'}
      end

      it "should expose the world as @world" do
        World.stub!(:find).and_return(mock_world(:update_attributes => false))
        put :update, :id => "1"
        assigns(:world).should equal(mock_world)
      end

      it "should re-render the 'edit' template" do
        World.stub!(:find).and_return(mock_world(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested world" do
      World.should_receive(:find).with("37").and_return(mock_world)
      mock_world.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the worlds list" do
      World.stub!(:find).and_return(mock_world(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(worlds_url)
    end

  end

end
