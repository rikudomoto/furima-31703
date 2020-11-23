class StreetAddress < ApplicationRecord
  belongs_to :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area
end
