class TimelineCategory < ActiveRecord::Base
  belongs_to :timeline
  has_many :timeline_items, dependent: :destroy
  validates :description, presence: true, length: { maximum: 255 }
end
