class Table < ActiveRecord::Base
  belongs_to :floorplan
  has_many :notes, as: :notable
end
