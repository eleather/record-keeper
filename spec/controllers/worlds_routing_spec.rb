require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WorldsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "worlds", :action => "index").should == "/worlds"
    end
  
    it "should map #new" do
      route_for(:controller => "worlds", :action => "new").should == "/worlds/new"
    end
  
    it "should map #show" do
      route_for(:controller => "worlds", :action => "show", :id => 1).should == "/worlds/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "worlds", :action => "edit", :id => 1).should == "/worlds/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "worlds", :action => "update", :id => 1).should == "/worlds/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "worlds", :action => "destroy", :id => 1).should == "/worlds/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/worlds").should == {:controller => "worlds", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/worlds/new").should == {:controller => "worlds", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/worlds").should == {:controller => "worlds", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/worlds/1").should == {:controller => "worlds", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/worlds/1/edit").should == {:controller => "worlds", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/worlds/1").should == {:controller => "worlds", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/worlds/1").should == {:controller => "worlds", :action => "destroy", :id => "1"}
    end
  end
end
