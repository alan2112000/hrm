

puts 'importing seed data'

User.delete_all
User.create([{ id: 1, name: 'alan', password: 'testtest', email: 'alan@mail.com' },
             { id: 2, name: 'alanalan', password: 'testtest', email: 'alanalan@mail.com' }
            ])

Type.delete_all
Type.create!([{ name: 'Absence', is_main: true },
              { name: 'Overtime', is_main: true },
              { name: 'Annual Leave' },
              { name: 'Sick' }
             ])

Role.delete_all
Role.create!([{ id: 1, name: 'root' },
              { id: 2, name: 'normal_user' }
             ])


UserRoleRelationship.delete_all
UserRoleRelationship.create!([{ user_id: 1, role_id: 1 },
                              { user_id: 2, role_id: 2 }])








