class Vendor < ActiveRecord::Base
  belongs_to :account
  belongs_to :event
  has_many :contacts
  has_many :notes, as: :notable
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
  
  accepts_nested_attributes_for :contacts
end
