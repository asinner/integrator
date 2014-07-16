class Location < ActiveRecord::Base
  belongs_to :event
  has_one :address, as: :addressable
  has_many :notes, as: :notable
  validates_presence_of :name, :purpose
  validates_length_of :name, :purpose, maximum: 255 
  
  accepts_nested_attributes_for :address
end
