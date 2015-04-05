class AddIsMainToType < ActiveRecord::Migration
  def change
   add_column :types, :is_main, :integer
  end
end
