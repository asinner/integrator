class EventLocation < ActiveRecord::Base
  
  # Associations
  belongs_to :event
  belongs_to :location
  
  # Validations
  validates :purpose, presence: true, length: { maximum: 255 }
  
  # Nestings
  accepts_nested_attributes_for :location, reject_if: :all_blank
end
