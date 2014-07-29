class AddTimelineCategoryRefToTimelineItems < ActiveRecord::Migration
  def change
    add_reference :timeline_items, :timeline_category, index: true
  end
end
