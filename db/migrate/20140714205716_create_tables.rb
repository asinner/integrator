class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.references :floorplan, index: true
      t.string :name
      t.integer :length
      t.integer :width
      t.integer :top
      t.integer :left
      t.integer :rotation
      t.string :style
      t.integer :seats

      t.timestamps
    end
  end
end
