class CreateAuditionDayDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :audition_day_directors do |t|
      t.integer :audition_day_id
      t.integer :director_id

      t.timestamps
    end
  end
end
