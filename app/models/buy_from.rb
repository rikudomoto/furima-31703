class BuyFrom
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address, :phone_number, :building_name, :buy, :token

  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}-\d{4}\z/, message: 'Please enter a hyphen' }
    validates :municipality, :address
    validates :phone_number, numericality: { with: /^(0{1}\d{9,10})$/, message: 'Figuresthe 11th digits' }
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, buy_id: buy.id)
  end
end
