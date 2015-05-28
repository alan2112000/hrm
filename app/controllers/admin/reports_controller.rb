class Admin::ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize! :read, @types

    @record_form = RecordForm.new(Record.new)
  end

  def generate
    @record_form = RecordForm.new(Record.new)

    if @record_form.validate(record_params)

      records            = Record.includes(:user).time_between(@record_form.start_time, @record_form.end_time)
      users              = records.group_by { |record| record.user_id }
      @users_record_list = UserReport.decorate_collection(users)
    else

      flash.now[:error] = @record_form.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def month_params
    params.permit()
  end

  def record_params
    params.require(:record).permit(:start_time, :end_time, :type_id, :user_id)
  end

  def start_time
    params[:start_time]
  end

  def end_time
    params[:end_time]
  end
end
