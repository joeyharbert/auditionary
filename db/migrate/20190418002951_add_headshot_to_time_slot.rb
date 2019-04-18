class AddHeadshotToTimeSlot < ActiveRecord::Migration[5.2]
  def change
    add_column :time_slots, :headshot, :string
  end
end
