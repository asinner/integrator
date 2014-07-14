class CreateTimelineItems < ActiveRecord::Migration
  def change
    create_table :timeline_items do |t|
      t.references :timeline_event, index: true
      t.string :description
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
