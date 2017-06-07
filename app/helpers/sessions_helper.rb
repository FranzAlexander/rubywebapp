module SessionsHelper

    def log_in(user) #Logs the user into the account.
    session[:user_id] = user.id
  end

  def current_user #Find what the id of the current user is.
    begin
    @current_user ||= User.find_by(id: session[:user_id])
  rescue exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Application error message"
       raise exc
end
  end

  def logged_in? #Checks if the user is logged in which is used in a different methods.
    !current_user.nil?
  end

  def log_out #Deletes the session.
    begin
    session.delete(:user_id)
    @current_user = nil
  rescue exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Application error message"
       raise exc
end
  end

  def authenticate_user #Checks if the user is logged in.
    if !logged_in?
      redirect_to login_path
    end
  end
end
