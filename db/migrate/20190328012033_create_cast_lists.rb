class CreateCastLists < ActiveRecord::Migration[5.2]
  def change
    create_table :cast_lists do |t|

      t.timestamps
    end
  end
end
