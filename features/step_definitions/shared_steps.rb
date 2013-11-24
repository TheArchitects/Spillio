Given /^I am logged in with cid "(.*)"$/i do |cas_user|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
end

# Prefabricates a user model with the given cas ide so we dont need to go
# through all the steps
Given /^I am logged in with cid "(.*)" as a (.*)$/i do |cas_user, user_type|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
  case user_type
  when 'Student'
    s = {
      name: 'Anon Student',
      about: 'Nothing to say',
      interest: 'Everything',
      section: Section.find_or_initialize_by_number(100),
      skills: [Skill.create!(:name => 'Ruby')],
      courses: [Course.find_or_initialize_by_name('CS161')]
    }
    Student.create_or_update(s, cas_user)
  end
  # TODO Implement more cases: instructor, admin
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Given(/the following user[s]? exist[s]?:$/)do |users_table|
  users_table.hashes.each do |user|
    Student.create!(user)
  end
end

Given(/the following instructor[s]? exist[s]?:$/) do |table|
  table.hashes.each do |int|
    Instructor.create!(int)
  end
end

Given(/the following group[s]? exist[s]?:$/) do |table|
  table.hashes.each do |gro|
    Group.create!(gro)
  end
end


Given(/the following student[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Student.create!(stu)
  end
end

#
# => Visit Steps
#

Given /^I am on the Search for Students Page$/ do
  visit(student_search_path)
end

Given /^I am on the profile page for "(.*)"$/ do |user|
  visit(student_path(User.find_by_name(user)))
end

Then /^I should be on the group Page for "(.*)"$/ do |user|
  visit(group_db_show_path(User.find_by_name(user).group_id))
end
