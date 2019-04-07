class AddStartAndEndToAuditionDayAndTimeSlot < ActiveRecord::Migration[5.2]
  def change
    add_column :audition_days, :start_time, :string
    add_column :audition_days, :end_time, :string
    add_column :time_slots, :start_time, :string
    add_column :time_slots, :end_time, :string
  end
end
