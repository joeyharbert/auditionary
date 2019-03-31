class CreateActorShowRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_show_roles do |t|
      t.integer :actor_id
      t.integer :show_role_id

      t.timestamps
    end
  end
end
