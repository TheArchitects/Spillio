require "rack_session_access/capybara"

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    Student.create!(user)
  end
end

Given /the following groups exist/ do |groups_table|
  groups_table.hashes.each do |group|
    Group.create(group)
  end
end

Given /^I am logged in$/i do
  CASClient::Frameworks::Rails::Filter.fake("12345")
end

Given /^I am logged in as a (.*)$/i do |cas_user|

  CASClient::Frameworks::Rails::Filter.fake(cas_user)
  
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end