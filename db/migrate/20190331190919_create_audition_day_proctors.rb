class CreateAuditionDayProctors < ActiveRecord::Migration[5.2]
  def change
    create_table :audition_day_proctors do |t|
      t.integer :audition_day_id
      t.integer :proctor_id

      t.timestamps
    end
  end
end
