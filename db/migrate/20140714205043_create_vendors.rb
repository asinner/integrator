class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.references :account, index: true
      t.string :name

      t.timestamps
    end
  end
end
