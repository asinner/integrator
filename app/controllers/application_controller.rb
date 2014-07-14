class ApplicationController < ActionController::Base
  # Include Pundit for simple authorization
  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Declare current user as a helper method
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def set_user_confirmation_hash
    @user.confirmation_hash = SecureRandom::hex(64)
    @user.save
  end

  # Ensure that a user is signed in. Redirects to sign in page if not.
  def authenticate_user
    redirect_to sign_in_path, flash: { error: 'Please sign in' } unless current_user
  end
  
end
