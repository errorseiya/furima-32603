FactoryBot.define do
  factory :item do
    name                 {Faker::Creature::Animal.name}
    comment              {"買ってください"}
    category_id          {"1"}
    condition_id         {"1"}
    shipping_charge_id   {"1"}
    prefecture_id        {"1"}
    days_to_ship_id      {"1"}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    # from: , toで整数になってる
    #  {Faker::Number.between(300, 9999999)}⬅︎小数点も出力してしまう
   
    

   

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
