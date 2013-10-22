
#Given I am on the page
Given /^I am on the "(.+)" page$/ do |page_path|
	page.visit("/#{page_path}")
end

#Make sure you are logged in
Given /^a valid user$/ do
  @user = User.create!({
             :username => "validusername",
             :password => "validPassword",
             :password_confirmation => "validPassword"
           })
end



Given /^I am not logged in$/ do 
	flunk "unimplemented"
end

Given /^I am logged in as (.+)$/ do |user|
	Given "a valid user"
  	visit signin_url
  	fill_in "username", :with => "validusername"
  	fill_in "Password", :with => "validPassword"
  	click_button "Sign in"
end

When /^I press "(.+)" button$/ do |button|
	click_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I should see "(.+)" on the page$/ do |text|
	if page.respond_to? :should
    	page.should have_content(text)
  	else
    	assert page.has_content?(text)
  	end
end

Then /^I should see a "(.+)" (.+)$/ do |name, tag|
	field = find_field(tag)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      	field_value.should =~ /#{name}/
    else
      	assert_match(/#{name}/, field_value)
    end
end


Then /^I should be on the "(.+)" page$/ do |page_name|
	current_path = URI.parse(current_url).path
  	if current_path.respond_to? :should
    	current_path.should == path_to(page_name)
  	else
    	assert_equal path_to(page_name), current_path
  	end
end

Then /^I should be on the "(.+)" page or on the "(.+)" page$/ do |page1, page2|
	current_path = URI.parse(current_url).path
  	if current_path.respond_to? :should
    	current_path.should == path_to(page1) or
    	current_path.should == path_to(page2)
  	else
  		test = (path_to(page1) == current_path or
  			path_to(page2) == current_path)
    	assert_equal test, true
  	end
end



