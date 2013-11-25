When /I check "(.*)"/ do |field|
  page.check(field)
end

When /^I select "(.*)" from "(.*)"$/ do |selection, box|
  page.select selection, :from => box
end

Then /^show me the page$/ do
  save_and_open_page
end






#
# => User input actions on a page
#

When /^I press "(.*)" button$/ do |button|
  page.click_button(button)
end

When /^I click "(.*)" link$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end



#
# => Existence of elements in a page
#

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |st, parent|
  with_scope(parent) { step st }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |st, parent, table_or_string|
  with_scope(parent) { step "#{st}:", table_or_string }
end

Then (/^(?:|I )should see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then (/^(?:|I )should see "([^"]*)" before "([^"]*)"$/) do |e1, e2|
  if page.respond_to? :should
    page.should have_content(text)
    page.body.index(e1).should < page.body.index(e2)
  else
    assert page.has_content?(text)
    assert page.body.index(e1) < page.body.index(e2)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then (/^(?:|I )should not see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Then /^the "([^\"]+)" field should be disabled$/ do |field|
  find_field(field)[:disabled].should == 'disabled'
end
