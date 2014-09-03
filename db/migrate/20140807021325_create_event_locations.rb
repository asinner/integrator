class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.references :event, index: true
      t.references :location, index: true
      t.string :purpose

      t.timestamps
    end
  end
end
