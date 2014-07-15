class Timeline < ActiveRecord::Base
  belongs_to :event
  has_many :timeline_items
  has_many :notes, as: :notable
  
  validates :name, presence: true
end
