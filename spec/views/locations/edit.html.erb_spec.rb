require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/edit.html.erb" do
  include LocationsHelper
  
  before(:each) do
    assigns[:location] = @location = stub_model(Location,
      :new_record? => false,
      :title => "value for title",
      :text => "value for text"
    )
  end

  it "should render edit form" do
    render "/locations/edit.html.erb"
    
    response.should have_tag("form[action=#{location_path(@location)}][method=post]") do
      with_tag('input#location_title[name=?]', "location[title]")
      with_tag('input#location_text[name=?]', "location[text]")
    end
  end
end


