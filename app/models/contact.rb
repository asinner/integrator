class Contact < ActiveRecord::Base
  belongs_to :account
  belongs_to :vendor
  has_many :notes, as: :notable
end
