class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :purpose
      t.references :event, index: true

      t.timestamps
    end
  end
end
