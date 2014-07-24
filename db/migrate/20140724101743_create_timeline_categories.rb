class CreateTimelineCategories < ActiveRecord::Migration
  def change
    create_table :timeline_categories do |t|

      t.timestamps
    end
  end
end
