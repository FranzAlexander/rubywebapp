class SessionsController < ApplicationController
  def new
  end

  def create
    begin
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to courses_path
    else
      flash.now[:danger] = 'Invalid credentials'
      render 'new'
    end
  rescue Exception => exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Store error message"
end
  end

  def destroy
    log_out
    redirect_to home_path
  end
end
