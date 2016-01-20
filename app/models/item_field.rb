class ItemField < ActiveRecord::Base
  belongs_to :item
  belongs_to :field

  validates :data, presence: true
end
