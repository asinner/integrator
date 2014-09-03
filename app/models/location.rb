class Location < ActiveRecord::Base
  
  # Associations
  has_many :event_locations
  has_many :events, through: :event_locations
  has_one :address, as: :addressable
  has_many :notes, as: :notable
  
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  
  # Nestings
  accepts_nested_attributes_for :address
end
