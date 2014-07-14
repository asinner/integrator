class User < ActiveRecord::Base
  belongs_to :account
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }  
  validates :email, presence: true, length: { maximum: 255 }  
  validate :email, with: /@/
  validates :password, presence: true, length: { maximum: 255, minimum: 5 }
  has_secure_password validations: false
end
