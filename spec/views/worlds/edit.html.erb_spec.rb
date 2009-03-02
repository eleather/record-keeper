require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/worlds/edit.html.erb" do
  include WorldsHelper
  
  before(:each) do
    assigns[:world] = @world = stub_model(World,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/worlds/edit.html.erb"
    
    response.should have_tag("form[action=#{world_path(@world)}][method=post]") do
      with_tag('input#world_name[name=?]', "world[name]")
    end
  end
end


