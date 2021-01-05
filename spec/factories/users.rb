FactoryBot.define do
  factory :user do
    nickname              {"ナナシ"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    # password              {"test1path"}
    password_confirmation {password}
    last_name             {"名無しの"}
    first_name            {"権平"}
    last_name_kana        {"ナナシノ"}
    first_name_kana       {"ゴンベイ"}
    birthday              {'2014-09-23'}
  end
end



