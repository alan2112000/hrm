class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :navigation_info, :authenticate_user!

  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_records_path(current_user), :alert => exception.message
  end

  def navigation_info
    @main_types ||= Type.main
  end

  def namespace
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_name_segments.join('/').camelize
  end

  private

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
