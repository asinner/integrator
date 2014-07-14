class Location < ActiveRecord::Base
  belongs_to :event
  has_one :address, as: :addressable
  has_many :notes, as: :notable
end
