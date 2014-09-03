class Vendor < ActiveRecord::Base
  include ApplicationHelper
  
  # Associations
  belongs_to :account
  has_many :contacts
  
  has_many :event_vendors, dependent: :destroy
  has_many :events, through: :event_vendors
  
  has_many :notes, as: :notable
  has_many :vendor_logs, dependent: :destroy
  
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
  validates :color, presence: true, length: { maximum: 255 }
  
  # Nestings
  accepts_nested_attributes_for :contacts
  
  before_validation :set_color, if: :new_record?
    
  # Prefers the color pallete found in the application helper before using a random color
  def set_color
    self.color = random_hex_color
  end
end
