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


admin = Admin.create(cid: '760906')
admin.save


puts "settings : Group size => #{Setting.first.max_group_size}"

courses = Course.create!([{ name: 'CS161' }, { name: 'CS186' }, { name: 'CS169' }])
sections = Section.create!([{ number: 100 }, { number: 101 }, { number: 102 }, { number: 103 }])

puts "Populating Users"

kayvan = Student.create!(name: 'Kayvan Najafzadeh', about:'I transfered to Berkeley from San Jose', interest: 'Hve been in three continents', cid:'1007417')
kayvan.section = sections[1]
kayvan.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }, { name: 'Python' }, { name: 'C' }, { name: 'JS' }])
kayvan.courses << courses[2]
kayvan.courses << courses[1]
kayvan.email = "kayvan.najafzadeh@gmail.com"
kayvan.save

megumi = Student.create!(name: ' Megumi Ishioka', about:'Doggie person', interest: 'Guys', cid:'883514')
megumi.section = sections[0]
megumi.skills << Skill.create!([{ name: 'Japanese' }, { name: 'Judo' }])
megumi.courses << courses[0]
megumi.courses << courses[2]
megumi.email = "megupertino@gmail.com"
megumi.save

kevin = Student.create!(name: 'Kevin Shen', about:'I am cool.', interest: 'Girls', cid:'946211')
kevin.section = sections[0]
kevin.skills << Skill.create!([{ name: 'Android' }, { name: 'Origami' }])
kevin.courses << courses[0]
kevin.email = "kevinshen34@gmail.com>"
kevin.save

arturo = Student.create!(name: 'Arturo Pacifico Griffini', about:'Nothing to say', interest: 'Everything', cid:'877183')
arturo.section = sections[1]
arturo.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }])
arturo.courses << courses[1]
arturo.email = "pacifico.arturo@gmail.com"
arturo.save

## Creating groups with mock assignments
puts "Populating Groups"
the_beatles = Group.create({group_name: 'Group 1'})
the_beatles.students << kevin
the_beatles.save

rolling = Group.create({group_name: 'Group 2'})
rolling.students << arturo
rolling.save

group3 = Group.create({group_name: 'Group 3'})
group3.students << megumi
group3.save

################################ Populating Assignments #####################################
puts "Populating Assignments"
## mock assignments iter 0
title = "Iteration 0"
description = "Are you ready?"
due_date = Time.now-(60*60*24*7)
max_grade = 20
submission_types = ['Link','File']
submission_labels = ['Heroku','Source File']

task = Task.create!(:title => title, :description => description, :due_date => due_date)
task.assign_to_all_groups(max_grade, submission_types, submission_labels)

assignment = Assignment.find_by_task_id_and_group_id(task.id,the_beatles.id)
assignment.grade = 19.5
assignment.ta_feedback = "You misspelled my name."
assignment.save

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

#^^^^^^^^^^^^^^^^^^^^^^^^^^^ Populating Assignments ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
puts "Populating Projects"

Project.create!(:title => "Cal Central", :url => "http://bptech.berkeley.edu/projects")
Project.create!(:title => "CalBears", :url => "http://bptech.berkeley.edu/projects")


puts "Seed planted :)"





