namespace :dev do
  desc 'import development fake data'
  task :import_fake_data => :environment do

    puts 'Setting Developement fake data'
    User.delete_all
    User.create([{ id: 1, name: 'alan', password: 'testtest', email: 'alan@mail.com' },
                 { id: 2, name: 'alanalan', password: 'testtest', email: 'alanalan@mail.com' }
                ])

    UserRoleRelationship.delete_all
    UserRoleRelationship.create!([{ user_id: 1, role_id: Settings.role_id.admin },
                                  { user_id: 2, role_id: Settings.role_id.normal_user }])

    Record.delete_all

    10.times do
      Record.create([
                        { user_id: 1, start_time: Faker::Time.between(2.days.ago, Time.now), end_time: Faker::Time.between(1.days.ago, Time.now),
                          type_id: Settings.type_id.annual_leave },
                    ])
    end

    10.times do
      Record.create([
                        { user_id: 2, start_time: Faker::Time.between(2.days.ago, Time.now), end_time: Faker::Time.between(1.days.ago, Time.now),
                          type_id: Settings.type_id.annual_leave },
                    ])

    end

    10.times do
      Record.create([
                        { user_id: 1, start_time: Faker::Time.between(2.days.ago, Time.now), end_time: Faker::Time.between(1.days.ago, Time.now),
                          type_id: Settings.type_id.annual_leave },
                    ])
    end
  end
end