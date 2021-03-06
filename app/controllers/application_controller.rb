class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private



  def is_admin?
    if current_user
      current_user.roles.any? { |role| role.admin? && role.wiki.administered_by?(current_user) }
    end
  end

  def ensure_admin!
    unless is_admin?
    @admin_errors = ["Insufficient permissions for the page you are trying to access"]

      # sign_out current_user

      # redirect_to root_path

      return false
    end
  end

end

# class AdminController < ApplicationController
  # before_action :ensure_admin!

# end
