require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/worlds/new.html.erb" do
  include WorldsHelper
  
  before(:each) do
    assigns[:world] = stub_model(World,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/worlds/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", worlds_path) do
      with_tag("input#world_name[name=?]", "world[name]")
    end
  end
end


