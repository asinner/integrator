class TimelineItemContact < ActiveRecord::Base
  belongs_to :timeline_item
  belongs_to :contact
end
