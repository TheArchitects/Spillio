Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    new_course = Course.create#(:name=>(user[:courses]))
    new_course.name = user[:courses]
    new_skill = Skill.create#(:name=>(user[:skills]))
    new_skill.name = user[:skills]
    new_section = Section.create#(:number=>(user[:section]))
    new_section.number = user[:section]
    new_name = user[:name]
    new_interest = user[:interest]
    
    new_user = User.create
    
    new_user.courses << new_course
    new_user.skills << new_skill
    new_user.section = new_section
    new_user.name = new_name
    new_user.interest = new_interest
  end
end

Given /^I am on the Search for Students Page$/ do
  page.visit('/search/students')
end

When /^I click on "(.+)" in the list of students$/ do |student_name|
  click_link(student_name)
end

Then /^I should be on the View Profile Page for "(.+)"$/ do |student_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  current_path.should == path_to('/students/#{student_name}')
end
