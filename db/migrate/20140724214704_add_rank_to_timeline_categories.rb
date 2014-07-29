class AddRankToTimelineCategories < ActiveRecord::Migration
  def change
    add_column :timeline_categories, :rank, :integer
  end
end
