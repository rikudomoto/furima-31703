FactoryBot.define do
  factory :buy_from do
    postal_code { '222-2222' }
    shipping_area_id { 2 }
    municipality { '福岡市' }
    address { '赤坂1-1' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
    building_name { "マンション" }
  end
end
