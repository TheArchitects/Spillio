Given /^I am on the Search for Students Page$/ do
  page.visit('/search/students')
end

When /^I click "(.+)" in the list of students$/ do |student_name|
  click_link(student_name)
end

Then /^I should be on the View Profile Page for "(.+)"$/ do |student_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  current_path.should == path_to('/students/#{student_name}')
end

Then /^I 
