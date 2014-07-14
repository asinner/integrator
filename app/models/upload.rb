class Upload < ActiveRecord::Base
  belongs_to :account
  belongs_to :event
end
