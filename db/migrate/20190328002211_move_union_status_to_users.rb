class MoveUnionStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :actors, :union_status, :integer
    add_column :users, :union_status, :integer
  end
end
