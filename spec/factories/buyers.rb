FactoryBot.define do
  factory :buyer_address do
    postal_code     { '123-4567' }
    prefecture_id   { Faker::Number.between(from: 1, to: 47 )}
    municipality    { '世田谷区' }
    address         { '上馬1−2−３' }
    building_name   { '一号室' }
    phone_number    { '09012345678' }
    token            {"tok_abcdefghijk00000000000000000" }
  end
end
