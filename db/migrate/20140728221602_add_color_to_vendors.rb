class AddColorToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :color, :string
  end
end
