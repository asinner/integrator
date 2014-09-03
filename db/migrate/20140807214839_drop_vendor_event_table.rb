class DropVendorEventTable < ActiveRecord::Migration
  def change
    drop_table :vendor_events
  end
end
