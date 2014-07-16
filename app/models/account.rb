class Account < ActiveRecord::Base
  has_many :uploads
  has_many :users, dependent: :destroy
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :users
  
  def has_enough_space? bytes
    if space_available > bytes
      true
    else
      false
    end
  end
  
  def space_available
    Account.space_limit - space_used
  end

  def space_used
    uploads.sum(:size)
  end
  
  def self.space_limit
    5.gigabytes
  end
  
end
