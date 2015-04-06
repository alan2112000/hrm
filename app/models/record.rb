# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  type_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  scope :absence_between, -> (start_date, end_date){ where("start_time >= ? AND end_time <= ?", start_date, end_date )}

  def absence?
    type_id == Settings.type_id.absence
  end

  def overtime?
    type_id == Settings.type_id.overtime
  end

  def annual_leave?
    type_id == Settings.type_id.annual_leave
  end
end
