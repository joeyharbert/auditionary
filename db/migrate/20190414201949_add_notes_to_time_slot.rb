class AddNotesToTimeSlot < ActiveRecord::Migration[5.2]
  def change
    add_column :time_slots, :notes, :text
  end
end
