# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
setting = Setting.create!
setting.max_group_size = 6
setting.save

puts "settings : #{Setting.first}"


courses = Course.create!([{ name: 'CS161' }, { name: 'CS168' }])
skills = Skill.create!([{ name: 'Java' }, { name: 'Ruby' }])
sections = Section.create!([{ number: 100 }, { number: 101 }])

kayvan = Student.create!(name: 'Kayvan', about:'Nothing to say', interest: 'Everything', cid:'10074171')
kayvan.section = sections[1]
kayvan.skills << skills[0]
kayvan.skills << skills[1]
kayvan.courses << courses[1]
kayvan.save

megumi = Student.create!(name: 'Megumi', about:'Doggie person', interest: 'Guys', cid:'1122233')
megumi.section = sections[0]
megumi.skills << skills[0]
megumi.skills << skills[1]
megumi.courses << courses[0]
megumi.save

kevin = Student.create!(name: 'Kevin', about:'I am cool.', interest: 'Girls', cid:'123987')
kevin.section = sections[0]
kevin.skills << skills[0]
kevin.skills << skills[1]
kevin.courses << courses[0]
kevin.save

alfonso = Student.create!(name: 'Alfonso', about:'Nothing to say', interest: 'Everything', cid:'010101')
alfonso.section = sections[1]
alfonso.skills << skills[0]
alfonso.skills << skills[1]
alfonso.courses << courses[1]
alfonso.save



# TODO: Groups should only be created with a special function each time a user is
# created. When a student is merged onto a new group, if its old group becomes
# empty, it must be deleted
the_beatles = Group.create_group_with_mock_assignments!('The Beatles')
the_beatles.students << kayvan
the_beatles.students << megumi
the_beatles.save


rolling = Group.create_group_with_mock_assignments!('The Rolling Stones')
rolling.students << kevin
rolling.save

req = GroupJoinRequest.create!
req.requester = kevin
req.requestee = kayvan
req.group_id = kevin.group_id
req.request_type = 'merge'
req.save


puts "Seed planted :)"