Given /I am on the Create New Profile page/ do
  page.visit('/students/new')
  Skill.create([{ name: 'Java' }, { name: 'Ruby' }])
end

When /I check "(.*)"/ do |field|
  page.check(field)
end

Then /I should be on the New User Profile page/ do
  current_path = URI.parse(current_url).path
  assert_equal current_path, '/students/create'
end
