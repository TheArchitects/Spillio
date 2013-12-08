Given /^I am logged in with cid "(.*)"$/i do |cas_user|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
end

Given(/^I am logged in as admin$/) do
  admin = Admin.create(cid: 100000)
  admin.save
  step "I am logged in with cid \"100000\""
end

#
# => Location Steps
#


Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit(path_to(page_name))
end
