require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/worlds/show.html.erb" do
  include WorldsHelper
  before(:each) do
    assigns[:world] = @world = stub_model(World,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/worlds/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

