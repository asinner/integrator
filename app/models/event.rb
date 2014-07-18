class Event < ActiveRecord::Base
  belongs_to :account
  has_many :contacts
  has_many :vendors, dependent: :destroy
  has_many :floorplans, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_one :timeline, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :starting_date, presence: true
end
