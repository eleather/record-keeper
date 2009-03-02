require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/index.html.erb" do
  include LocationsHelper
  
  before(:each) do
    assigns[:locations] = [
      stub_model(Location,
        :title => "value for title",
        :text => "value for text"
      ),
      stub_model(Location,
        :title => "value for title",
        :text => "value for text"
      )
    ]
  end

  it "should render list of locations" do
    render "/locations/index.html.erb"
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for text".to_s, 2)
  end
end

