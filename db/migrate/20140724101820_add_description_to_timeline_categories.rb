class AddDescriptionToTimelineCategories < ActiveRecord::Migration
  def change
    add_column :timeline_categories, :description, :string
  end
end
