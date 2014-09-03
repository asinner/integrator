class Event < ActiveRecord::Base
  # Associations
  belongs_to :account
  has_many :clients, dependent: :destroy
  has_many :contacts
  has_many :floorplans, dependent: :destroy
  
  has_many :event_vendors, dependent: :destroy
  has_many :vendors, through: :event_vendors
  
  has_many :event_locations, dependent: :destroy
  has_many :locations, through: :event_locations
  
  has_many :timelines, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
  
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :starting_date, presence: true
  
  accepts_nested_attributes_for :clients, reject_if: :all_blank
  accepts_nested_attributes_for :locations, reject_if: :all_blank
  
end
