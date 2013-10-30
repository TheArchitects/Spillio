Before do
  Skill.delete_all
  Course.delete_all
  Section.delete_all
  Skill.create([{ name: 'Java' }, { name: 'Ruby' }])
  Course.create([{ name: 'CS161' }, {name: 'CS162' }])
  Section.create([{ number: 100 }, {number: 101 }])
end

Given /I am on the Create New Profile page/ do
  page.visit('/students/new')
  visit current_path
end

When /I check "(.*)"/ do |field|
  page.check(field)
end

Then /^I should be on the New User Profile page/ do
  current_path = URI.parse(current_url).path
  assert_equal current_path, '/students/create'
end

Then /^I select "(.*)" from "(.*)"$/ do |selection, box|
  page.select selection, :from => box
end
  
Then /^show me the page$/ do
  save_and_open_page
end

Then /^I press "(.*)"$/ do |button|
  page.click_button(button)
end

Then /^I should see "(.*)"$/ do |text|
  have_content(text)
end
