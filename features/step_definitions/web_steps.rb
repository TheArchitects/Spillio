When /I check "(.*)"/ do |field|
  page.check(field)
end

Then /^I select "(.*)" from "(.*)"$/ do |selection, box|
  page.select selection, :from => box
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I press "(.*)"$/ do |button|
  page.click_button(button)
end

Then /^I should see "(.*)"$/ do |text|
  have_content(text)
end