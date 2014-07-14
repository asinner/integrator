class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_user_confirmation_hash
    @user.confirmation_hash = SecureRandom::hex(64)
    @user.save
  end
end
