class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_status_id, presence: true
  validates :item_category_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  validates :image, presence: true
  validates :user, presence: true
  validates :price, presence: true
end
