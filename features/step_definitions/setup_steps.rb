Given /settings set/ do
	Setting.create(max_group_size: 3)
end

Given /the group size is (\d*)/ do |size|
	setting = Setting.first
	setting.max_group_size = size
	setting.save
end

#
# => Model creation
#

Given(/the following user[s]? exist[s]?:$/)do |users_table|
  users_table.hashes.each do |user|
    Student.create!(user)
  end
end

Given(/the following admin[s]? exist[s]?:$/) do |table|
  table.hashes.each do |int|
    Instructor.create!(int)
  end
end

Given(/the following group[s]? exist[s]?:$/) do |table|
  table.hashes.each do |gro|
    Group.create!(gro)
  end
end


Given(/the following student[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Student.create!(stu)
  end
end

Given(/^the student with cid "(.*?)" is a reader$/) do |arg1|
  s = Student.find_by_cid(arg1)
  s.make_reader
  s.save
end
