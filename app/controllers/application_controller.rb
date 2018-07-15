class ApplicationController < ActionController::Base
  before_action :get_current_user

  private
  def get_current_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
  end

  def check_for_login
    unless @current_user.present?
      flash[:redirect_from] = request.original_url
      redirect_to login_path
    end
  end

  def check_for_admin
    unless @current_user.present? && @current_user.admin?
      redirect_to root_path
    end
  end
end
