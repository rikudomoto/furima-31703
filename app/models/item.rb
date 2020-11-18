class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :delivery_fee, :shipping_area, :says_to_ship
  has_one_attached :image
  belongs_to :user
  has_one    :buy

  validates :name, :explanation,                                                   presence: true
  validates :category_id, :status, :delivery_fee, :shipping_area, :says_to_ship,   numericality: { other_than: 1 }
  with_options presence: true do
    validates :price,          format: {with: /^[0-9]+$/, message:'is invalid. Please write all numbers in half size'}
  end
end
