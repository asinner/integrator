class AddFloorplanToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :floorplan, :boolean
  end
end
