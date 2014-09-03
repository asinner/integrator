class RemoveEventReferenceFromLocations < ActiveRecord::Migration
  def change
    remove_reference :locations, :event, index: true
  end
end
