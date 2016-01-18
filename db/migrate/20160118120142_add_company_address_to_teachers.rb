class AddCompanyAddressToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :company_address, :string
  end
end
