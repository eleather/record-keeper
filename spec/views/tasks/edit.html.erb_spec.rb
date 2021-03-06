require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/edit.html.erb" do
  include TasksHelper
  
  before(:each) do
    assigns[:task] = @task = stub_model(Task,
      :new_record? => false,
      :description => "value for description"
    )
  end

  it "should render edit form" do
    render "/tasks/edit.html.erb"
    
    response.should have_tag("form[action=#{task_path(@task)}][method=post]") do
      with_tag('input#task_description[name=?]', "task[description]")
    end
  end
end


