class RemoveNotesColumnFromTimeSlot < ActiveRecord::Migration[5.2]
  def change
    remove_column :time_slots, :notes, :text
  end
end
