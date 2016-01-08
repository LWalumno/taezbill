class ChangeNumberIntoStringInBills < ActiveRecord::Migration
  def change
    remove_column :bills, :number, :integer
    add_column :bills, :number, :string
  end
end
