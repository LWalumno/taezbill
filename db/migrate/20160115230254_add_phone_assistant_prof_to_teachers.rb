class AddPhoneAssistantProfToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :assistant, :boolean, default: true
    add_column :teachers, :professor, :boolean, default: false
    add_column :teachers, :phone_number, :string
    add_column :teachers, :lewagon_name, :string
  end
end
