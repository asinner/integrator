class Timeline < ActiveRecord::Base
  belongs_to :event
  has_many :timeline_events
  has_many :timeline_items, through: :timeline_events
  has_many :notes, as: :notable
end
