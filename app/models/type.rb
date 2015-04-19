# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Type < ActiveRecord::Base
  has_many :records

  scope :main, -> { where(is_main: true) }
  scope :absence, -> { where(type_id: Settings.type_id.absence) }
  scope :overtime, -> { where(type_id: Settings.type_id.overtime) }
  scope :annual_leave, -> { where(type_id: Settings.type_id.annual_leave) }
  scope :sick, -> { where(type_id: Settings.type_id.sick) }
end
