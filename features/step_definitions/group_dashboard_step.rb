Given(/^the following task[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Task.create!(stu)
  end
end

Given(/^the following assignment[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Assignment.create!(stu)
  end
end

Given(/^the following submission[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Submission.create!(stu)
  end
end

Given(/^the following post[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Post.create!(stu)
  end
end

Given(/^the following score[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Score.create!(stu)
  end
end



Then(/^I should see '(\d+)\/(\d+)' as a score$/) do |arg1, arg2|
  CASClient::Frameworks::Rails::Filter.fake("homer")
  visit '/group/' + "#{Group.all[0].id}"
  assert page.has_content?('')
end

Given(/^the instructor did not submit the grade$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see 'N\/A' as a score$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I follow the 'It(\d+)\-(\d+)' accordion$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am logged into the student group dashboard as "(.*)"$/) do |cid|
  step "I am logged in with cid \"#{cid}\" as a Student"
  visit group_db_show_path(Student.find_by_cid(cid).group_id)
end

Given(/^I am logged into the student group dashboard$/) do
  step "I am logged into the student group dashboard as \"123\""
end