Before do
  Skill.delete_all unless not Skill.table_exists?
  Course.delete_all unless not Course.table_exists?
  Section.delete_all unless not Section.table_exists?
  Course.create([{ name: 'CS161' }, {name: 'CS162' }])
  Section.create([{ number: 100 }, {number: 101 }])
end

Given /I am on the Create New Student Profile page/ do
  visit new_student_path
end

Given /I am on the Edit Student Profile page of "(.*)"/ do |student_name|
  visit edit_student_path Student.find_by_name(student_name)
end

Then(/^I search for "(.*)"$/) do |query_terms|
  visit student_search_path query: query_terms
end
