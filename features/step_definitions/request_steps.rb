Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    Student.create!(user)
  end
end

Given /^I am on the Search for Students Page$/ do
  save_and_open_page
  visit('/search/students')
  save_and_open_page
end

When /^I click on "(.+)" in the list of students$/ do |student_name|
  click_link(student_name)
end

Then /^I should be on the View Profile Page for "(.+)"$/ do |student_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  current_path.should == path_to('/students/#{student_name}')
end
