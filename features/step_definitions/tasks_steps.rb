Given /^that I have created a task "(.*)"$/ do |desc|
	Task.create!(:description => desc)
end
