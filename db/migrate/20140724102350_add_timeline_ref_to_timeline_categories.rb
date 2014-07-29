class AddTimelineRefToTimelineCategories < ActiveRecord::Migration
  def change
    add_reference :timeline_categories, :timeline, index: true
  end
end
