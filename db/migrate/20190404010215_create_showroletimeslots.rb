class CreateShowroletimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :showroletimeslots do |t|
      t.integer :show_role_id
      t.integer :time_slot_id

      t.timestamps
    end
  end
end
