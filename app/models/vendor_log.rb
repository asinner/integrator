class VendorLog < ActiveRecord::Base
  # Associations
  belongs_to :vendor
  
  # Validations
  validates :body, presence: true
end
