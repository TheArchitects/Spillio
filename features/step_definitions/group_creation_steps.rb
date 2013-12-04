Given(/^there is a request to join from "(.*)" to "(.*)"$/) do |arg1, arg2|
  GroupJoinRequest.create!(:requester => Student.find_by_name(arg1), :requestee => Student.find_by_name(arg2), :request_type=>'join')
end

Given(/^there is an invitation to join from "(.*)" to "(.*)"$/) do |arg1, arg2|
  GroupJoinRequest.create!(:requester => Student.find_by_name(arg1), :requestee => Student.find_by_name(arg2), :request_type=>'invite')
end

Given(/^there is a request to merge from "(.*)" to "(.*)"$/) do |arg1, arg2|
  GroupJoinRequest.create!(:requester => Student.find_by_name(arg1), :requestee => Student.find_by_name(arg2), :request_type=>'merge')
end


