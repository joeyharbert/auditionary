class RemoveCompanyIdFromTimeSlot < ActiveRecord::Migration[5.2]
  def change
    remove_column :time_slots, :company_id, :integer
  end
end
