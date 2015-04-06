namespace :dev do
  desc 'import development fake data'
  task :import => :environment do

    puts 'Setting Developement fake data'
    User.delete_all
    User.create([{ id: 1, name: 'alan', password: 'testtest', email: 'alan@mail.com' },
                 { id: 2, name: 'alanalan', password: 'testtest', email: 'alanalan@mail.com' }
                ])

    UserRoleRelationship.delete_all
    UserRoleRelationship.create!([{ user_id: 1, role_id: 1 },
                                  { user_id: 2, role_id: 2 }])

    Record.delete_all


  end
end