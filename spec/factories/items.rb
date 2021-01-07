FactoryBot.define do
  factory :item do
    name              {"ナナシ"}
    comment                {Faker::Internet.free_email}
    category              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"名無しの"}
    first_name            {"権平"}
    last_name_kana        {"ナナシノ"}
    first_name_kana       {"ゴンベイ"}
    birthday              {'2014-09-23'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end

image, :name, :comment, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price
    ).merge(user_id: current_user.id)