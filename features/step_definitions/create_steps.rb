Before do
  Skill.delete_all
  Course.delete_all
  Section.delete_all
  Skill.create([{ name: 'Java' }, { name: 'Ruby' }])
  Course.create([{ name: 'CS161' }, {name: 'CS162' }])
  Section.create([{ number: 100 }, {number: 101 }])
end

Given /I am on the Create New Student Profile page/ do
  page.visit('/students/new')
  visit current_path
end

Then /^I should be on the New User Profile page/ do
  current_path = URI.parse(current_url).path
  current_path.should match(/students\/(\d)+$/)
end


