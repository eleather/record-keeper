require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/show.html.erb" do
  include TasksHelper
  before(:each) do
    assigns[:task] = @task = stub_model(Task,
      :description => "value for description"
    )
  end

  it "should render attributes in <p>" do
    render "/tasks/show.html.erb"
    response.should have_text(/value\ for\ description/)
  end
end

