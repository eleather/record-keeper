module LocationsHelper
  
  def show_child_locations(location, level)
    location.children.inject("") do |html, child|
      html << "<tr><td>"
      level.times { html << "&nbsp;&nbsp;" } 
      html << child.title + "</td><td>" + 
              link_to('Show', location) + "</td><td>" + 
              link_to('Edit', edit_location_path(child)) + "</td><td>" + 
              link_to('Destroy', location, :confirm => 'Are you sure?', :method => :delete) + "</td></tr>"
      html << show_child_locations(child, level + 1)
    end
  end
end
