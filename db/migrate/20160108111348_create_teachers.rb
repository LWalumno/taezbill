class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :company_status
      t.string :siret

      t.timestamps null: false
    end
  end
end
