class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password]) && user.admin == 0
      log_in user
      redirect_to courses_path
    elsif user && user.authenticate(params[:session][:password]) && user.admin == 1
      log_in user
      redirect_to admin_path
    else
      flash.now[:danger] = 'Invalid credentials'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
