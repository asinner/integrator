class TimelineItem < ActiveRecord::Base
  attr_accessor :st_date, :st_hour, :st_min, :st_period, :et_date, :et_hour, :et_min, :et_period
  
  # Associations
  belongs_to :timeline_category
  belongs_to :vendor
  has_one :note, as: :notable
  
  # Validations  
  validates :description, presence: true, length: { maximum: 255 }
  validates_presence_of :st_date, :st_hour, :st_min, :st_period, :et_date, :et_hour, :et_min, :et_period
  validates :st_hour, inclusion: { in: 1..12 }
  validates :st_min, inclusion: { in: 0..59 }
  validates :st_period, inclusion: { in: %w(am pm) }
  validates :et_hour, inclusion: { in: 1..12 }
  validates :et_min, inclusion: { in: 0..59 }
  validates :et_period, inclusion: { in: %w(am pm) }
  validate :vendor_exists
  
  # Before validation
  before_validation :change_time_components_to_integers
  before_save :assemble_times
  
  # Nestings
  accepts_nested_attributes_for :note, reject_if: :all_blank
  
  # Methods
  def vendor_exists
    if vendor_id.present? && !Vendor.exists?(vendor_id)
      errors.add(:vendor_id, 'does not exist') 
    end
  end
  
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
