class Item < ActiveRecord::Base
  belongs_to :bill
  has_many :item_fields
  has_many :fields, through: :item_fields
end
