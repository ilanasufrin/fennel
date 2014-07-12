class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.where(session_token: session[:session_token]).first
  end
  helper_method :current_user

  def ensure_logged_in_user
    redirect_to root_path unless !!current_user
  end
end
