class Bill < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :customer
  has_many :items, dependent: :destroy
  has_many :item_fields, through: :items
  has_many :fields,  -> { distinct }, through: :item_fields

  validates :name, presence: true
  validates :date, presence: true
  validates :number, presence: true
end
