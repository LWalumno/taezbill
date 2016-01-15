class Item < ActiveRecord::Base
  belongs_to :bill
  has_many :item_fields, dependent: :destroy
  has_many :fields, through: :item_fields
end
