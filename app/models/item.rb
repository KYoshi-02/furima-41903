class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :item_category
  belongs_to :shipping_cost
  belongs_to :shipping_date

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_status_id, numericality: { other_than: 1 }
  validates :item_category_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :image, presence: true
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
