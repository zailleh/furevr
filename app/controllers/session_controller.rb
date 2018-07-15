class SessionController < ApplicationController
  def new
    flash[:redirect_from] = flash[:redirect_from] if flash[:redirect_from].present?
  end

  def create
    # raise 'hell'
    # get the user with this email address
    user = User.find_by :email => params[:email]

    # if hashed passwords match
    if user.present? && user.authenticate(params[:password])
      # remember this user in the session hash
      session[:user_id] = user.id
      # redirect to home page
       if flash[:redirect_from].present?
        redirect_to flash[:redirect_from]
       else
        redirect_to user_path(user)
       end
    else # if hashed passwords don't match
      flash[:login_error] = "Sorry, your username or password do not match"
      redirect_to login_path
      # redirect to login page
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

