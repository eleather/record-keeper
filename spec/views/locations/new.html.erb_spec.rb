require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/new.html.erb" do
  include LocationsHelper
  
  before(:each) do
    assigns[:location] = stub_model(Location,
      :new_record? => true,
      :title => "value for title",
      :text => "value for text"
    )
  end

  it "should render new form" do
    render "/locations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", locations_path) do
      with_tag("input#location_title[name=?]", "location[title]")
      with_tag("input#location_text[name=?]", "location[text]")
    end
  end
end


