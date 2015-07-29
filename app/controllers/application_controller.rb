class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    services_path
  end

  def logged_in?
    session[:user_id].present?
  end

  helper_method :logged_in?
end
