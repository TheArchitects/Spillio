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

task_1 = Task.mock_task_1
assignment_1 = Assignment.create_from_group_and_task(the_beatles, task_1)
submission_1 = Submission.create({
  label: "Your credit card details plz",
  content: "http://www.google.com",
  submitted_date: Date.parse('5-6-2006'),
  subm_type: "Link"
  })
assignment_1.submissions << submission_1
assignment_1.save

task_2 = Task.mock_task_2
assignment_2 = Assignment.create_from_group_and_task(the_beatles, task_2)
submission_2 = Submission.create({
  label: "Plz gimme the codez",
  subm_type: "File"
  })
assignment_2.submissions << submission_2
assignment_2.save
the_beatles.students << kayvan
the_beatles.students << megumi
the_beatles.save

## creating second mock group

rolling = Group.create({group_name: 'The Rolling Stones'})

task_1 = Task.mock_task_1
assignment_1 = Assignment.create_from_group_and_task(rolling, task_1)
submission_1 = Submission.create({
  label: "Your credit card details plz",
  content: "http://www.google.com",
  submitted_date: Date.parse('5-6-2006'),
  subm_type: "Link"
  })
assignment_1.submissions << submission_1
assignment_1.save

task_2 = Task.mock_task_2
assignment_2 = Assignment.create_from_group_and_task(rolling, task_2)
submission_2 = Submission.create({
  label: "Plz gimme the codez",
  subm_type: "File"
  })
assignment_2.submissions << submission_2
assignment_2.save

rolling.students << kevin
rolling.save

# Creating a Group Join

req = GroupJoinRequest.create!
req.requester = kevin
req.requestee = kayvan
req.request_type = 'merge'
req.save

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

puts "Seed planted :)"





