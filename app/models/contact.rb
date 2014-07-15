class Contact < ActiveRecord::Base
  belongs_to :account
  belongs_to :vendor
  has_many :notes, as: :notable
  
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
end
