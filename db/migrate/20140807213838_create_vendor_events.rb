class CreateVendorEvents < ActiveRecord::Migration
  def change
    create_table :vendor_events do |t|
      t.references :event, index: true
      t.references :vendor, index: true

      t.timestamps
    end
  end
end
