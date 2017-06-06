class SessionsController < ApplicationController
  def new
  end

  #Loggin into the account.
  def create
    begin
      #Finding the user by email.
    user = User.find_by(email: params[:session][:email].downcase)
      #Making sure that what the user as entered into the login fields are correct.
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
  #Destroys the current user session.
  def destroy
    log_out
    redirect_to home_path
  end
end
