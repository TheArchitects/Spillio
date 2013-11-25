Given /^I am logged in with cid "(.*)"$/i do |cas_user|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
end

# Prefabricates a user model with the given cas ide so we dont need to go
# through all the steps
Given /^I am logged in with cid "(.*)" as a (.*)$/i do |cas_user, user_type|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
  unless User.exists?(:cid => cas_user)
    case user_type
    when 'Student'
      s = {
        name: 'Anon Student',
        about: 'Nothing to say',
        interest: 'Everything',
        section_id: Section.find_or_initialize_by_number(100).id,
        skill_ids: [Skill.find_or_initialize_by_name('Ruby').id],
        course_ids: [Course.find_or_initialize_by_name('CS161').id]
      }
      Student.create_for_current_user!(s, cas_user)
    end
    # TODO Implement more cases: instructor, admin
  end
end



#
# => Location Steps
#

Given /^I am on the Search for Students Page$/ do
  visit(student_search_path)
end

Given /^I am on the profile page for "(.*)"$/ do |user|
  visit(student_path(User.find_by_name(user)))
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
