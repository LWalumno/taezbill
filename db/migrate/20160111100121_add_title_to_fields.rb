class AddTitleToFields < ActiveRecord::Migration
  def change
    add_column :fields, :title, :string
    Field.find_each do |field|
      field.title = field.name
      field.name = field.name.downcase.split(" ").join("_")
      field.save!
    end
  end
end
