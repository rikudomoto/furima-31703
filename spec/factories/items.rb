FactoryBot.define do
  factory :item do
    name                  { "商品名" }
    category_id           { '2' }
    status_id             { '2' }
    delivery_fee_id       { '2' }
    shipping_area_id      { '2' }
    says_to_ship_id       { '2' }
    price                 { '500' }
    explanation           { Faker::Lorem.sentence }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/ruby.png'), filename: 'ruby.png')
    end
  end
end

