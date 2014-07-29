class DropEventRefFromTimelineCategories < ActiveRecord::Migration
  def change
    remove_column :timeline_categories, :event_id
  end
end
