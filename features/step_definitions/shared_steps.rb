require "rack_session_access/capybara"


Given /^I am logged in$/i do
  CASClient::Frameworks::Rails::Filter.fake("Anon")
  page.set_rack_session(:cas_user => "12345")
end

Given /^I am logged in as a Student$/i do
  CASClient::Frameworks::Rails::Filter.fake("Anon Student")
  page.set_rack_session(:cas_user => "12345")

  student = Student.create(name: 'Anon Student', about:'Nothing to say', interest: 'Everything', cid:'12345')
  student.section = Section.find_or_initialize_by_number(100)
  student.skills << Skill.find_or_initialize_by_name('Ruby')
  student.courses << Course.find_or_initialize_by_name('CS161')
  student.save
end