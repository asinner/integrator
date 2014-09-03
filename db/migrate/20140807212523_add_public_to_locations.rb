class AddPublicToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :public, :boolean
  end
end
