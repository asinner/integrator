class Event < ActiveRecord::Base
  belongs_to :account
  has_many :vendors, dependent: :destroy
  has_many :floorplans, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
end
