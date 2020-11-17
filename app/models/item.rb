class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :delivery_fee, :shipping_area, :says_to_ship
  has_one_attached :image
  belongs_to :user
  has_one    :buy

  validates :name, :explanation, :price,                                           presence: true
  validates :category_id, :status, :delivery_fee, :shipping_area, :says_to_ship,   numericality: { other_than: 1 }
end
