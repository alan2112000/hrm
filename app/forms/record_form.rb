require 'reform/form/coercion'

class RecordForm < Reform::Form
  include Coercion
  include Rails.application.routes.url_helpers

  property :start_time, validates: {presence: true}, type: Date
  property :end_time, validates: {presence: true}, type: Date
  property :type_id, validates: {presence: true}

  validate :start_time_before_end_time

  def types
    Type.all
  end

  def start_time_before_end_time
    if start_time - end_time >= 0
      errors[:base] << 'Start time must before end time'
    end
  end

  def url
    model.persisted? ? user_record_path(model.user, model) : user_records_path(model.user)
  end
end