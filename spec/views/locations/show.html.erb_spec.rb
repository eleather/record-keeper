require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/show.html.erb" do
  include LocationsHelper
  before(:each) do
    assigns[:location] = @location = stub_model(Location,
      :title => "value for title",
      :text => "value for text"
    )
  end

  it "should render attributes in <p>" do
    render "/locations/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ text/)
  end
end

