class Admin::ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.all
    authorize! :read, @types

    @record_types = Type.all
  end

  def generate
    start_day = Date.new(start_time[:year].to_i,
                         start_time[:month].to_i,
                         start_time[:day].to_i)

    end_day = Date.new(end_time[:year].to_i,
                       end_time[:month].to_i,
                       end_time[:day].to_i)

    @records= Record.includes(:user).annual_leave(start_day, end_day)

    users = @records.group_by { |record| record.user_id }
    @users_record_list = UserReport.decorate_collection(users)
  end

  private

  def month_params
    params.permit()
  end

  def start_time
    params[:start_time]
  end

  def end_time
    params[:end_time]
  end
end
