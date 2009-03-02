class Location < ActiveRecord::Base
  
  acts_as_nested_set :scope => :location
  
end
