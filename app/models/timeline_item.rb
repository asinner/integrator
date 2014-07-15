class TimelineItem < ActiveRecord::Base
  attr_accessor :st_date, :st_hour, :st_min, :st_period, :et_date, :et_hour, :et_min, :et_period
  
  belongs_to :timeline
  has_many :notes, as: :notable
  
  has_many :timeline_item_contacts
  has_many :contacts, through: :timeline_item_contacts
  
  validates :description, presence: true, length: { maximum: 255 }
  validates_presence_of :st_date, :st_hour, :st_min, :st_period, :et_date, :et_hour, :et_min, :et_period
  validates :st_hour, inclusion: { in: 1..12 }
  validates :st_min, inclusion: { in: 0..59 }
  validates :st_period, inclusion: { in: %w(am pm) }
  
  validates :et_hour, inclusion: { in: 1..12 }
  validates :et_min, inclusion: { in: 0..59 }
  validates :et_period, inclusion: { in: %w(am pm) }
  
  
  before_validation :change_time_components_to_integers
  before_save :assemble_times
  
  def change_time_components_to_integers
    # Changes the hour to int
    self.st_hour = self.st_hour.to_i
    # Changes the min to int
    self.st_min = self.st_min.to_i
    
    # Changes the hour to int
    self.et_hour = self.et_hour.to_i
    # Changes the min to int
    self.et_min = self.et_min.to_i
    
  end
  
  def assemble_times
    self.start_time = DateTime.parse("#{self.st_date} #{self.st_hour}:#{self.st_min} #{self.st_period}")
    self.end_time = DateTime.parse("#{self.et_date} #{self.et_hour}:#{self.et_min} #{self.et_period}")    
  end
end
