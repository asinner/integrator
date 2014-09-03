class RemovePurposeFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :purpose, :string
  end
end
