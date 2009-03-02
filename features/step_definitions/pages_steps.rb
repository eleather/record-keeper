Given /^that I have created a page "(.*)" with content "(.*)"$/ do |title, content|
	Page.create!(:title => title, :content => content)
end