class RenameRolesToShowRoles < ActiveRecord::Migration[5.2]
  def change
    rename_table :roles, :show_roles
  end
end
