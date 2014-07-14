class TimelineItem < ActiveRecord::Base
  belongs_to :timeline_event
  has_many :notes, as: :notable
end
