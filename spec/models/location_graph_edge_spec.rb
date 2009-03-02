require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LocationGraphEdge do
  before(:each) do
    @valid_attributes = {
      :location1 => 1,
      :location2 => 1,
      :transition_note => "value for transition_note"
    }
  end

  it "should create a new instance given valid attributes" do
    LocationGraphEdge.create!(@valid_attributes)
  end
end
