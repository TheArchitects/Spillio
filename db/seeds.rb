# Required seeds

setting = Setting.create!
setting.max_group_size = 6
setting.show_group_join_feature = false
setting.save

puts "Required seeds planted; Group size => #{Setting.first.max_group_size}"

courses = Course.create!([
					{ name: 'CS152' }, 
					{ name: 'CS160' }, 
					{ name: 'CS161' }, 
					{ name: 'CS162' }, 
					{ name: 'CS164' }, 
					{ name: 'CS169' },
					{ name: 'CS170' },
					{ name: 'CS174' },
					{ name: 'CS184' },
					{ name: 'CS186' },
					{ name: 'CS188' },
					{ name: 'CS189' },
					{ name: 'CS194' },
					{ name: 'CS195' },
					{ name: 'CS196' },
					{ name: 'CS198' },])

admins = Group.create({group_name: 'Admins'})

=begin
puts "Populating Users"

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

project_a = Project.create(:title=>"An awesome project", :description=> "Join our project!", :url=>"http://www.awesome.com")
project_a.save
project_b = Project.create(:title=>"An even more awesome project", :description=> "No join our project!", :url=>"http://www.coolpeople.com")
project_b.save

puts "Seed planted :)"
=end






