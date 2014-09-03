class RemoveEventRefFromVendors < ActiveRecord::Migration
  def change
    remove_reference :vendors, :event, index: true
  end
end
