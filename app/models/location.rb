class Location < ActiveRecord::Base
  
  acts_as_nested_set :scope => :location
  has_many :location_edges_out, :foreign_key => :location1, :class_name => "LocationGraphEdge"
  has_many :outgoing_adjacent_locations, :through => :location_edges_out, :source => :location1
  has_many :location_edges_in, :foreign_key => :location2, :class_name => "LocationGraphEdge"
  has_many :incoming_adjacent_locations, :through => :location_edges_in, :source => :location2
  
  
end
