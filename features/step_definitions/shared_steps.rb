require "rack_session_access/capybara"


Given /I am logged in/ do
  CASClient::Frameworks::Rails::Filter.fake("Bart")
  page.set_rack_session(:cas_user => "12345")
end