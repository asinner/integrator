class EventPolicy < ApplicationPolicy
  def find
    @user.account.events.include? @record
  end
end