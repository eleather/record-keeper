require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/new.html.erb" do
  include PagesHelper
  
  before(:each) do
    assigns[:page] = stub_model(Page,
      :new_record? => true,
      :title => "value for title",
      :content => "value for content"
    )
  end

  it "should render new form" do
    render "/pages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", pages_path) do
      with_tag("input#page_title[name=?]", "page[title]")
      with_tag("input#page_content[name=?]", "page[content]")
    end
  end
end


