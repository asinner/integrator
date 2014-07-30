class Upload < ActiveRecord::Base
  # Includes
  include ModelHelper
  
  # Associations
  belongs_to :account
  belongs_to :event
  has_one :note, as: :notable
  
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validate :validate_file_size
  
  # Nestings
  accepts_nested_attributes_for :note
  
  def destroy_if
    
  end
  

  def self.size_limit
    8.megabytes
  end

  def self.s3_bucket
    'events_public'
  end

  def validate_file_size
    errors[:base] << "File size is too large (must be under #{ActionController::Base.helpers.number_to_human_size(Upload.size_limit)})" if self.size > Upload.size_limit
  end

  def assign_attributes_from_file file
    self.original_filename = file.original_filename
    self.extension = File.extname(self.original_filename)
    self.size = file.size
    self.content_type = file.content_type
    self.name = self.original_filename
    self.set_s3_filename
  end
    
  def set_s3_filename
    name = make_filesystem_friendly(self.name)
    count = Upload.where(original_filename: self.name).count
    if count > 0
      name = name.gsub(self.extension, '')
      self.s3_filename = "#{name}#{count}#{self.extension}"
    else
      self.s3_filename = name
    end
  end
  
  def to_s3 file
    s3 = AWS::S3.new
    bucket = s3.buckets['events_public']
    obj = bucket.objects["#{self.s3_filename}"]
    obj.write(file: file.path, acl: :public_read)
  end
  
end
