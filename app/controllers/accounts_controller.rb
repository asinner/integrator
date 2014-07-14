class AccountsController < ApplicationController
  
  after_action :set_user_confirmation_hash, only: :create
  
  def new
    @account = Account.new
    @account.users.build
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @account = Account.new(account_params)
    @user = @account.users.first
    @user.confirmation_hash = SecureRandom::hex(64)
    
    respond_to do |format|
      if @account.save
        format.html
        format.js
      else
        format.html
        format.js        
      end
    end
  end
  
  def account_params
    params.require(:account).permit(users_attributes: [:first_name, :last_name, :email, :password])
  end
end
