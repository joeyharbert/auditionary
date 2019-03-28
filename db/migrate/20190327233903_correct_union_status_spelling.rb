class CorrectUnionStatusSpelling < ActiveRecord::Migration[5.2]
  def change
    rename_column :actors, :union_staus, :union_status
  end
end
