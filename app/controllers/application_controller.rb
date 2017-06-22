class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end


  def login!(user)
    if user
      token = user.reset_session_token!
      session[:session_token] = token
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid user name or password."]
      # render flash.now[:errors]
      render :new
    end
  end

  def redirect_if_logged_in
    if current_user
      redirect_to cats_url
    end
  end

end
