class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true
  
  validates :message, presence: true 
end
