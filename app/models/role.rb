class Role < ActiveRecord::Base
  has_many :user_role_relationships
  has_many :users, through:  :user_role_relationships
end
