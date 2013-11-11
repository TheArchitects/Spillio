# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


courses = Course.create([{ name: 'CS161' }, { name: 'CS168' }])
skills = Skill.create([{ name: 'Java' }, { name: 'Ruby' }])
sections = Section.create([{ number: 100 }, { number: 101 }])
groups = Group.create([{ group_name: 'Group1'}, { group_name: 'Group2'}])



kayvan = Student.create(name: 'Kayvan', about:'Nothing to say', interest: 'Everything', cid:'1007417')
kayvan.section = sections[1]
kayvan.skills << skills[0]
kayvan.skills << skills[1]
kayvan.courses << courses[1]
kayvan.group = groups[0]
kayvan.save

megumi = Student.create(name: 'Megumi', about:'Doggie person', interest: 'Guys', cid:'1122233')
megumi.section = sections[0]
megumi.skills << skills[0]
megumi.skills << skills[1]
megumi.courses << courses[0]
megumi.save

kevin = Student.create(name: 'Kevin', about:'I am cool.', interest: 'Girls', cid:'123987')
kevin.section = sections[0]
kevin.skills << skills[0]
kevin.skills << skills[1]
kevin.courses << courses[0]
kevin.save
