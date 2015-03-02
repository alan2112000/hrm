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
end
