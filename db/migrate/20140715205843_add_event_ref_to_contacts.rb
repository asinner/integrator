class AddEventRefToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :event, index: true
  end
end
