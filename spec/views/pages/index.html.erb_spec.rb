require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/index.html.erb" do
  include PagesHelper
  
  before(:each) do
    assigns[:pages] = [
      stub_model(Page,
        :title => "value for title",
        :content => "value for content"
      ),
      stub_model(Page,
        :title => "value for title",
        :content => "value for content"
      )
    ]
  end

  it "should render list of pages" do
    render "/pages/index.html.erb"
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for content".to_s, 2)
  end
end

