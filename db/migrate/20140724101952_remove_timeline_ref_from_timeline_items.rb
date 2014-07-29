class RemoveTimelineRefFromTimelineItems < ActiveRecord::Migration
  def change
    remove_column :timeline_items, :timeline_id
  end
end
