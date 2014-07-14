class AddEventRefToVendors < ActiveRecord::Migration
  def change
    add_reference :vendors, :event, index: true
  end
end
