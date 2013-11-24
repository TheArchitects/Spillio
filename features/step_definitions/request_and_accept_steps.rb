When /^I click on "(.+)" in the list of students$/ do |student_name|
  click_link(student_name)
end

Then /^I should be on the View Profile Page for "(.+)"$/ do |student_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  current_path.should == "/students/#{Student.find_by_name(student_name).id}"
end

Given(/^there is a request to join from "(.*)" to "(.*)"$/) do |arg1, arg2|
  GroupJoinRequest.create!(:requester => Student.find_by_name(arg1), :requestee => Student.find_by_name(arg2), :request_type=>'join')
end

