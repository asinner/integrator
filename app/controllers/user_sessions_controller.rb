class UserSessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first
    @authenticated = true if @user && @user.authenticate(params[:password])
    respond_to do |format|     
      if @authenticated
        session[:user_id] = @user.id
        format.html { redirect_to events_path }
        format.js
      else
        format.html { redirect_to sign_in_path, flash: { error: 'Invalid email or password' } }
        format.js
      end
    end    
  end
  
  def destroy
    reset_session
    redirect_to root_url, flash: { notice: 'Logged out' }
  end
end
