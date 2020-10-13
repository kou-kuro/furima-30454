FactoryBot.define do
  factory :product do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id  { 2 }
    day_ship_id    { 2 }
    price { '600' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
