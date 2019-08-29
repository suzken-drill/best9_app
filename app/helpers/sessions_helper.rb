module SessionsHelper
  def log_in
  	session_key = SecureRandom.base64(10)
    session[:session_key] = session_key
  end
  def log_out
    session.delete(:session_key)
  end
  def log_in?
	  session[:session_key].present?
  end
  def current_session_key
    session[:session_key]
  end
end
