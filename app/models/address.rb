class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates_presence_of :line1, :city, :state
  validates_length_of :line1, :line2, :city, :state, :zip, maximum: 255
end
