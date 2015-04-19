class RecordsController < ApplicationController
  load_and_authorize_resource

  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @records = Record.paginate(page: params[:page], per_page: 10).of_user(current_user.id)
  end

  def show
  end

  def new
    @record = current_user.records.new
  end

  def edit
  end

  def create
    @record = current_user.records.new(record_params)
      if @record.save
        redirect_to user_records_path(current_user), notice: 'Record was successfully created.'
      else
        render :new
      end
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to user_records_path(current_user, @record), notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to user_records_path(current_user), notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_record
      @record = current_user.reocrds.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:start_time, :end_time, :type_id, :user_id)
    end
end
