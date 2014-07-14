class Event < ActiveRecord::Base
  belongs_to :account
  has_many :vendors
  has_many :floorplans
  has_many :locations
  has_many :timelines
  has_many :uploads
  has_many :notes, as: :notable
end
