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


admin = Admin.create(cid: 1000)
admin.save


puts "settings : Group size => #{Setting.first.max_group_size}"

courses = Course.create!([{ name: 'CS161' }, { name: 'CS186' }, { name: 'CS169' }])
sections = Section.create!([{ number: 100 }, { number: 101 }])

kayvan = Student.create!(name: 'Kayvan Najafzadeh', about:'I transfered to Berkeley from San Jose', interest: 'Hve been in three continents', cid:'1001')
kayvan.section = sections[1]
kayvan.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }, { name: 'Python' }, { name: 'C' }, { name: 'JS' }])
kayvan.courses << courses[2]
kayvan.courses << courses[1]
kayvan.email = "kayvan.najafzadeh@gmail.com"
kayvan.save

megumi = Student.create!(name: ' Megumi Ishioka', about:'Doggie person', interest: 'Guys', cid:'1002')
megumi.section = sections[0]
megumi.skills << Skill.create!([{ name: 'Japanese' }, { name: 'Judo' }])
megumi.courses << courses[0]
megumi.courses << courses[2]
megumi.email = "megupertino@gmail.com"
megumi.save

kevin = Student.create!(name: 'Kevin Shen', about:'I am cool.', interest: 'Girls', cid:'1003')
kevin.section = sections[0]
kevin.skills << Skill.create!([{ name: 'Android' }, { name: 'Origami' }])
kevin.courses << courses[0]
kevin.email = "kevinshen34@gmail.com>"
kevin.save

alfonso = Student.create!(name: 'Alfonso GOMEZ-JORDANA MANAS', about:'Nothing to say', interest: 'Everything', cid:'1004')
alfonso.section = sections[1]
alfonso.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
alfonso.courses << courses[1]
alfonso.email = "alfongj@gmail.com"
alfonso.save

jalal = Student.create!(name: 'Jalal Buckley', about:'Nothing to say', interest: 'Everything', cid:'1005')
jalal.section = sections[1]
jalal.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }])
jalal.courses << courses[1]
jalal.email = "jalal.buckley@gmail.com"
jalal.save

arturo = Student.create!(name: 'Arturo Pacifico Griffini', about:'Nothing to say', interest: 'Everything', cid:'1006')
arturo.section = sections[1]
arturo.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }])
arturo.courses << courses[1]
arturo.email = "pacifico.arturo@gmail.com"
arturo.save

## Creating groups with mock assignments
the_beatles = Group.create({group_name: 'The Beatles'})
the_beatles.students << kayvan
the_beatles.students << alfonso
the_beatles.save

rolling = Group.create({group_name: 'The Rolling Stones'})
rolling.students << kevin
rolling.students << arturo
rolling.save

group3 = Group.create({group_name: 'The Test Group'})
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





