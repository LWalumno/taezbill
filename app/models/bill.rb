class Bill < ActiveRecord::Base
  belongs_to :teacher
  has_many :items
  has_many :item_fields, through: :items
  has_many :fields, through: :item_fields
end
