module SessionsHelper
  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    token = session[:session_token]
    nil if token.nil?
    @current_user ||= User.find_by_session_token(token)
    @current_user
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in!
    unless current_user
      redirect_to new_session_url
    end
  end

  def require_not_logged_in!
    if current_user
      redirect_to root_url
    end
  end

  def is_current_user?(user)
    return false if current_user.nil?
    user.id == current_user.id
  end
end
