class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :name
      t.references :event, index: true

      t.timestamps
    end
  end
end
