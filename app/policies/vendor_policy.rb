class VendorPolicy < ApplicationPolicy
  def find
    @user.account.events.include? @record.event
  end
end