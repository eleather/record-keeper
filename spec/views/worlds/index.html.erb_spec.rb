require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/worlds/index.html.erb" do
  include WorldsHelper
  
  before(:each) do
    assigns[:worlds] = [
      stub_model(World,
        :name => "value for name"
      ),
      stub_model(World,
        :name => "value for name"
      )
    ]
  end

  it "should render list of worlds" do
    render "/worlds/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

