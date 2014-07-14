class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :account, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :confirmation_hash
      t.boolean :confirmed

      t.timestamps
    end
  end
end
