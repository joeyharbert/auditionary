class ChangeTimeSlotIdColumnNameInNotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :timeslot_id, :time_slot_id
  end
end
