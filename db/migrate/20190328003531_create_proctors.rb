class CreateProctors < ActiveRecord::Migration[5.2]
  def change
    create_table :proctors do |t|

      t.timestamps
    end
  end
end
