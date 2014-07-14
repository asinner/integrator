class TimelineEvent < ActiveRecord::Base
  belongs_to :timeline
  has_many :timeline_items
  has_many :notes, as: :notable
end
