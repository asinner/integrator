class Upload < ActiveRecord::Base
  belongs_to :account
  belongs_to :event
  has_many :notes, as: :notable
end
