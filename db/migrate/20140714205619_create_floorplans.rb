class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.references :event, index: true
      t.string :name

      t.timestamps
    end
  end
end
