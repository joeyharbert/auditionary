class AddCompanyIdToAuditionDay < ActiveRecord::Migration[5.2]
  def change
    add_column :audition_days, :company_id, :integer
  end
end
