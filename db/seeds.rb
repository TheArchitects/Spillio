# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:2
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
setting = Setting.create!
setting.max_group_size = 6
setting.save


admin = Admin.create(cid: 1007417)
admin.save


puts "settings : Group size => #{Setting.first.max_group_size}"

courses = Course.create!([{ name: 'CS161' }, { name: 'CS168' }])
sections = Section.create!([{ number: 100 }, { number: 101 }])

kayvan = Student.create!(name: 'Fake Kayvan', about:'Nothing to say', interest: 'Everything', cid:'1007')
kayvan.section = sections[1]
kayvan.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }])
kayvan.courses << courses[1]
kayvan.email = "kayvan.najafzadeh@gmail.com"
kayvan.save

megumi = Student.create!(name: 'Megumi', about:'Doggie person', interest: 'Guys', cid:'1122233')
megumi.section = sections[0]
megumi.skills << Skill.create!([{ name: 'Japanese' }, { name: 'Judo' }])
megumi.courses << courses[0]
megumi.email = "megupertino@gmail.com"
megumi.save

kevin = Student.create!(name: 'Kevin', about:'I am cool.', interest: 'Girls', cid:'123987')
kevin.section = sections[0]
kevin.skills << Skill.create!([{ name: 'Android' }, { name: 'Origami' }])
kevin.courses << courses[0]
kevin.email = "kevinshen34@gmail.com>"
kevin.save

alfonso = Student.create!(name: 'Alfonso', about:'Nothing to say', interest: 'Everything', cid:'010101')
alfonso.section = sections[1]
alfonso.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
alfonso.courses << courses[1]
alfonso.email = "alfongj@gmail.com"
alfonso.save

## Creating groups with mock assignments
the_beatles = Group.create({group_name: 'The Beatles'})
the_beatles.students << kayvan
the_beatles.students << megumi
the_beatles.save

rolling = Group.create({group_name: 'The Rolling Stones'})
rolling.students << kevin
rolling.save


################################ Populating Assignments #####################################
puts "Populating Assignments"
## mock assignments iter 1.1
title = "Iteration 1.1"
description = "Lets do some TDD :)"
due_date = Time.now
max_grade = 20
submission_types = ['Link','File']
submission_labels = ['Heroku','Source File']

task = Task.create!(:title => title, :description => description, :due_date => due_date)
task.assign_to_all_groups(max_grade, submission_types, submission_labels)


## mock assignments iter 1.2
title = "Iteration 1.2"
description = "Did you do TDD???"
due_date = Time.now+(60*60*24*7)
max_grade = 20
submission_types = ['Link','File']
submission_labels = ['Heroku','Source File']

task = Task.create!(:title => title, :description => description, :due_date => due_date)
task.assign_to_all_groups(max_grade, submission_types, submission_labels)

## mock assignments iter 2.1
title = "Iteration 2.1"
description = "Time to find some bugs"
due_date = Time.now+(60*60*24*14)
max_grade = 20
submission_types = ['Link','File']
submission_labels = ['Heroku','Source File']

task = Task.create!(:title => title, :description => description, :due_date => due_date)
task.assign_to_all_groups(max_grade, submission_types, submission_labels)

## mock assignments iter 2.2
title = "Iteration 2.2"
description = "Kill those bugs"
due_date = Time.now+(60*60*24*21)
max_grade = 20
submission_types = ['Link','File']
submission_labels = ['Heroku','Source File']

task = Task.create!(:title => title, :description => description, :due_date => due_date)
task.assign_to_all_groups(max_grade, submission_types, submission_labels)

# Creating a Group Join

req = GroupJoinRequest.create!
req.requester = kevin
req.requestee = kayvan
req.request_type = 'merge'
req.save
#^^^^^^^^^^^^^^^^^^^^^^^^^^^ Populating Assignments ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

# Makeing couple readers

stephanie = Student.create!(name: 'Stephanie', about:'Nothing to say', interest: 'Everything', cid:'000001')
stephanie.section = sections[1]
stephanie.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
stephanie.courses << courses[1]
stephanie.make_reader
stephanie.save

alan = Student.create!(name: 'alan', about:'Nothing to say', interest: 'Everything', cid:'000002')
alan.section = sections[1]
alan.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
alan.courses << courses[1]
alan.make_reader
alan.save

william = Student.create!(name: 'william', about:'Nothing to say', interest: 'Everything', cid:'000002')
william.section = sections[1]
william.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
william.courses << courses[1]
william.make_reader
william.save

project_a = Project.create(:title=>"An awesome project", :description=> "Join our project!", :url=>"http://www.awesome.com")
project_a.save
project_b = Project.create(:title=>"An even more awesome project", :description=> "No join our project!", :url=>"http://www.coolpeople.com")
project_b.save

puts "Seed planted :)"





