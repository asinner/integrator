class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :zip
      t.string :state
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
  end
end
