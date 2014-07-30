class Note < ActiveRecord::Base
  # Associations
  belongs_to :notable, polymorphic: true
  
  # Callbacks
  after_save { |note| note.destroy if note.message.blank? }
end
