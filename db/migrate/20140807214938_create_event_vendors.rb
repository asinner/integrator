class CreateEventVendors < ActiveRecord::Migration
  def change
    create_table :event_vendors do |t|
      t.references :event, index: true
      t.references :vendor, index: true

      t.timestamps
    end
  end
end
