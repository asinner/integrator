class DropTimelineEvents < ActiveRecord::Migration
  def change
    drop_table :timeline_events
  end
end
