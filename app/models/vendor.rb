class Vendor < ActiveRecord::Base
  include ApplicationHelper
  
  # Associations
  belongs_to :account
  belongs_to :event
  has_many :contacts
  has_many :notes, as: :notable
  
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
  validates :color, presence: true, length: { maximum: 255 }
  
  # Nestings
  accepts_nested_attributes_for :contacts
  
  # Hooks
  before_validation :set_color, if: :new_record?
  
  # Prefers the color pallete found in the application helper before using a random color
  def set_color
    count = self.event.vendors.count
    if palette[count].present? 
      self.color = palette[count]
    else
      self.color = random_hex_color
    end
  end
end
