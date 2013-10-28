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
jalal = Student.create(name: 'Jalal', about:'I am idiot.', interest: 'Idiot people')
jalal.section = sections[1]
jalal.skills << skills[0]
jalal.skills << skills[1]
jalal.courses << courses[1]
jalal.save
