Given(/the following instructor exists:$/) do |table|
  table.hashes.each do |int|
    Instructor.create!(int)
  end
end

And /the following group exist:$/ do |table|
  table.hashes.each do |gro|
    Group.create!(gro)
  end
end


And /the following students exist:$/ do |table|
  table.hashes.each do |stu|
    Student.create!(stu)
  end
end


Given(/^the following tasks exist:$/) do |table|
  table.hashes.each do |stu|
    Task.create!(stu)
  end
end

Given(/^the following submission_fields exist:$/) do |table|
  table.hashes.each do |stu|
    Submission.create!(stu)
  end
end

Given(/^the following posts exist:$/) do |table|
  table.hashes.each do |stu|
    Post.create!(stu)
  end
end

Given(/^the following score was received:$/) do |table|
  table.hashes.each do |stu|
    Score.create!(stu)
  end
end


When(/^I follow the 'It(\d+)\-(\d+)' accordion$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see '(\d+)\/(\d+)' as a score$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^the instructor did not submit the grade$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see 'N\/A' as a score$/) do
  pending # express the regexp above with the code you wish you had
end
