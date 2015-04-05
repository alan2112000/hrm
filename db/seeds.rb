puts 'importing seed data'

User.delete_all
User.create([{ id: 1, name: 'alan', password: 'testtest', email: 'alan@mail.com' },
             { id: 2, name: 'alanalan', password: 'testtest', email: 'alanalan@mail.com' }
            ])

Type.delete_all
Type.create!([{ id: 1, name: 'Absence', is_main: true },
              { id: 2, name: 'Overtime', is_main: true },
              { id: 3, name: 'Annual Leave' },
              { id: 4, name: 'Sick' }
             ])

Role.delete_all
Role.create!([{ id: 1, name: 'admin' },
              { id: 2, name: 'root'},
              { id: 3, name: 'normal_user' }
             ])


UserRoleRelationship.delete_all
UserRoleRelationship.create!([{ user_id: 1, role_id: 1 },
                              { user_id: 2, role_id: 3 }])








