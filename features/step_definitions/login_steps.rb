=begin
Refer to
https://github.com/rubycas/rubycas-client#testing
for testing CAS


=end
=begin

Given /^I am on the "(.+)" page$/ do |page_name|
	case page_name
  when 'home'
    page.visit("/")
  end
end

When /^I press "(.+)" button$/ do |button|
	click_button(button)
end

When /^I follow "(.*)" link$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I should see "(.+)" on the page$/ do |text|

    	assert page.has_content?(text)

end

Then /^I should see a "(.+)" button$/ do |name|
	assert page.has_content?(name)
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
=end
