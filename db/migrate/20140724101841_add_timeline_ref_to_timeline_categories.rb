class AddTimelineRefToTimelineCategories < ActiveRecord::Migration
  def change
    add_reference :timeline_categories, :event, index: true
  end
end
