class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.references :account, index: true
      t.references :event, index: true
      t.integer :size
      t.string :s3_filename
      t.string :original_filename
      t.string :name
      t.string :extension

      t.timestamps
    end
  end
end
