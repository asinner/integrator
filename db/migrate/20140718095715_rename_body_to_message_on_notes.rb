class RenameBodyToMessageOnNotes < ActiveRecord::Migration
  def change
    rename_column :notes, :body, :message
  end
end
