class AddNameToAudition < ActiveRecord::Migration[5.2]
  def change
    add_column :audition_days, :name, :string
  end
end
