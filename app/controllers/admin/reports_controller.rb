class Admin::ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.all
    authorize! :read, @types
  end
end
