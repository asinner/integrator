class VendorEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :vendor
end
