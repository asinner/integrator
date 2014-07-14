class Floorplan < ActiveRecord::Base
  belongs_to :event
  has_many :tables
  has_many :notes, as: :notable
end
