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


kayvan = Student.create(name: 'Kayvan', about:'Nothing to say', interest: 'Everything', cid:'1007417')
kayvan.section = sections[1]
kayvan.skills << skills[0]
kayvan.skills << skills[1]
kayvan.courses << courses[1]
kayvan.save


# TODO: Groups should only be created with a special function each time a user is
# created. When a student is merged onto a new group, if its old group becomes
# empty, it must be deleted

puts "Seed planted :)"
