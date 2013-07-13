class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  private 
  def not_authenticated
    redirect_to login_path, alert:"You must be logged in to see this"
  end


  def authenticate_admin_user!
    require_login
    unless current_user.is_admin?
      redirect_to root_path, alert:"You must be an admin"
    end
  end
end
