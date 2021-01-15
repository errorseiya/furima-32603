FactoryBot.define do
  factory :user do
    nickname              {"ナナシ"}
    email                 {Faker::Internet.free_email}
    # ⬇⬇⬇︎パスワードは英数混合なので始めに混合のものを記述してあげる
    password              {'0a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name             {"名無しの"}
    first_name            {"権平"}
    last_name_kana        {"ナナシノ"}
    first_name_kana       {"ゴンベイ"}
    birthday              {'2014-09-23'}
  end
end

