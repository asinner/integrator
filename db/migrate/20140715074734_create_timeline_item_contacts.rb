class CreateTimelineItemContacts < ActiveRecord::Migration
  def change
    create_table :timeline_item_contacts do |t|
      t.references :timeline_item, index: true
      t.references :contact, index: true

      t.timestamps
    end
  end
end
