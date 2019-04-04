class RenameShowRoleTimeSlots < ActiveRecord::Migration[5.2]
  def change
    rename_table :showroletimeslots, :show_role_time_slots
  end
end
