class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :type_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
