class CreateVendorLogs < ActiveRecord::Migration
  def change
    create_table :vendor_logs do |t|
      t.references :vendor, index: true
      t.text :body

      t.timestamps
    end
  end
end
