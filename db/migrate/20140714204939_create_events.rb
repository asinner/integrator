class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starting_date
      t.references :account, index: true

      t.timestamps
    end
  end
end
