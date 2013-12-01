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

admin = Admin.create(cid: 1007417)
admin.save

puts "settings : Group size => #{Setting.first.max_group_size}"

courses = Course.create!([{ name: 'CS161' }, { name: 'CS168' }])
sections = Section.create!([{ number: 100 }, { number: 101 }])

kayvan = Student.create!(name: 'Fake Kayvan', about:'Nothing to say', interest: 'Everything', cid:'1007')
kayvan.section = sections[1]
kayvan.skills << Skill.create!([{ name: 'Java' }, { name: 'Ruby' }])
kayvan.courses << courses[1]
kayvan.save

megumi = Student.create!(name: 'Megumi', about:'Doggie person', interest: 'Guys', cid:'1122233')
megumi.section = sections[0]
megumi.skills << Skill.create!([{ name: 'Japanese' }, { name: 'Judo' }])
megumi.courses << courses[0]
megumi.save

kevin = Student.create!(name: 'Kevin', about:'I am cool.', interest: 'Girls', cid:'123987')
kevin.section = sections[0]
kevin.skills << Skill.create!([{ name: 'Android' }, { name: 'Origami' }])
kevin.courses << courses[0]
kevin.save

alfonso = Student.create!(name: 'Alfonso', about:'Nothing to say', interest: 'Everything', cid:'010101')
alfonso.section = sections[1]
alfonso.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
alfonso.courses << courses[1]
alfonso.save

# TODO: Groups should only be created with a special function each time a user is
# created. When a student is merged onto a new group, if its old group becomes
# empty, it must be deleted
the_beatles = Group.create_group_with_mock_assignments('The Beatles')
the_beatles.students << kayvan
the_beatles.students << megumi
the_beatles.save

rolling = Group.create_group_with_mock_assignments('The Rolling Stones')
rolling.students << kevin
rolling.save

req = GroupJoinRequest.create!
req.requester = kevin
req.requestee = kayvan
req.request_type = 'merge'
req.save

# Makeing couple readers

Stephanie = Student.create!(name: 'Stephanie', about:'Nothing to say', interest: 'Everything', cid:'000001')
Stephanie.section = sections[1]
Stephanie.skills << Skill.create!([{ name: 'Juggling' }, { name: 'Knitting' }])
Stephanie.courses << courses[1]
Stephanie.make_reader
Stephanie.save

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

ReaderRequest.create(responded: false, requester: kayvan.id)
ReaderRequest.create(responded: false, requester: kevin.id)



puts "Seed planted :)"
