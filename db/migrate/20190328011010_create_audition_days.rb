class CreateAuditionDays < ActiveRecord::Migration[5.2]
  def change
    create_table :audition_days do |t|
      t.integer :length
      t.text :requirements
      t.boolean :active
      t.integer :show_id

      t.timestamps
    end
  end
end
