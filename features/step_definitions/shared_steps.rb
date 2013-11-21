require "rack_session_access/capybara"


Given /^I am logged in$/i do
  CASClient::Frameworks::Rails::Filter.fake("12345")
end

Given /^I am logged in as a Student$/i do
  CASClient::Frameworks::Rails::Filter.fake("12345")
  s ={
    name: 'Anon Student', 
    about:'Nothing to say', 
    interest: 'Everything', 
    cid:'12345',
    section: Section.find_or_initialize_by_number(100),
    skills: Skill.find_or_initialize_by_name('Ruby'),
    courses: Course.find_or_initialize_by_name('CS161')
  }
  Student.create_for_current_user!(s,"12345")
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end