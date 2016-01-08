class CreateItemFields < ActiveRecord::Migration
  def change
    create_table :item_fields do |t|
      t.string :data
      t.references :item, index: true, foreign_key: true
      t.references :field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
