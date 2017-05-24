module SessionsHelper

    def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    begin
    @current_user ||= User.find_by(id: session[:user_id])
  rescue Exception => exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Store error message"
end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    begin
    session.delete(:user_id)
    @current_user = nil
  rescue Exception => exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Store error message"
end
  end

  def authenticate_user
    if !logged_in?
      redirect_to login_path
    end
  end
end
