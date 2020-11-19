class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :says_to_ship
  has_one_attached :image
  belongs_to :user
  has_one    :buy

  with_options presence: true do
    validates :price, numericality: { greater_than: 299, message: 'is invalid. Please write all numbers in half size' }
    validates :price, numericality: { less_than: 10_000_000, message: 'is invalid. Please write all numbers in half size' }
    validates :name, :explanation, :image
    validates :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :says_to_ship_id, numericality: { other_than: 1 }
  end
end
