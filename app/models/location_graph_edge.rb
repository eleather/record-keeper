class LocationGraphEdge < ActiveRecord::Base
  belongs_to :location1, :foreign_key => :location1, :class_name => "Location"
  belongs_to :location2, :foreign_key => :location2, :class_name => "Location"
end
