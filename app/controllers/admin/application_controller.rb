class Admin::ApplicationController < ApplicationController
  layout "admin"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :restrict_access

  private

  def restrict_access
    redirect_to root_path unless current_user.admin?
  end
end
