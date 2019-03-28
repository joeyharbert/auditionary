class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.integer :length
      t.integer :sort
      t.integer :actor_id
      t.integer :company_id
      t.integer :audition_day_id

      t.timestamps
    end
  end
end
