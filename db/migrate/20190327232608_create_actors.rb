class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.integer :union_staus

      t.timestamps
    end
  end
end
