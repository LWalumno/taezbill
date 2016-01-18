class AddCustomerToBills < ActiveRecord::Migration
  def change
    add_reference :bills, :customer, index: true, foreign_key: true
  end
end
