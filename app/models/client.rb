class Client < ActiveRecord::Base
  belongs_to :event
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
end
