puts 'importing seed data'

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









