class Account < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :users
end
