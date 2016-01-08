class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.string :date
      t.integer :number
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
