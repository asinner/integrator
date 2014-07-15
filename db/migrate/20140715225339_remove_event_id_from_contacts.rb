class RemoveEventIdFromContacts < ActiveRecord::Migration
  def change
    remove_reference :contacts, :event, index: true
  end
end
