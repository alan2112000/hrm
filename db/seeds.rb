# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'importing seed data'

User.delete_all
User.create!([{ name: 'alan', email: 'alan21120000@gmail.com', password: 'testtest' },
              { name: 'normal_user', email: 'other_peopple_maile@mail.com', password: 'testtest' }])


Type.delete_all
Type.create!([{ name: 'OverTime' },
              { name: 'Absence' },
              { name: 'annual_leave' },
              { name: 'sick' }
             ])


Role.delete_all
Role.create!([{ name: 'root' },
              { name: 'normal_user' }])









