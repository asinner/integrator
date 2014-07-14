class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :account, index: true
      t.references :vendor, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :position

      t.timestamps
    end
  end
end
