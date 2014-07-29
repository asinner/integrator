class AddVendorRefToTimelineItems < ActiveRecord::Migration
  def change
    add_reference :timeline_items, :vendor, index: true
  end
end
