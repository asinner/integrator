class RenameTimelineRefOnTimelineItems < ActiveRecord::Migration
  def change
    rename_column :timeline_items, :timeline_event_id, :timeline_id
  end
end
