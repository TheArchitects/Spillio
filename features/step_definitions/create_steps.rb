Before do
  Skill.delete_all
  Course.delete_all
  Section.delete_all
  Skill.create([{ name: 'Java' }, { name: 'Ruby' }])
  Course.create([{ name: 'CS161' }, {name: 'CS162' }])
  Section.create([{ number: 100 }, {number: 101 }])
end

Given /I am on the Create New Student Profile page/ do
  visit new_student_path
end

Given /I am on the Edit Student Profile page of "(.*)"/ do |student_name|
  visit edit_student_path Student.find_by_name(student_name)
end

Then /^I should be on the New User Profile page/ do
  current_path = URI.parse(current_url).path
  current_path.should match(/students\/(\d)+$/)
end

Then /^I should be on the User Profile page of "(.*)"/ do |student_name|
  current_path = URI.parse(current_url).path
  current_path.should match(student_path(Student.find_by_name(student_name)))
end


