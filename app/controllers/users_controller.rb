class UsersController < ApplicationController
  before_action :check_is_current_user, :only => :show

  def new
    @user = User.new
    render :new, :layout => 'signup'
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, :layout => 'signup'
    end
  end

  def show
    @pets = User.find(params[:id]).pets
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_is_current_user
    # raise 'hell'
    if @current_user.present? && @current_user.id == params[:id].to_i
      # Do nothing, this is correct!
    elsif !@current_user.present?
      # save request path and go to login screen
      flash[:redirect_from] = request.original_url
      redirect_to login_path
    else
      redirect_to root_path
    end

  end
end
