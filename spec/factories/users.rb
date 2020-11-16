FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"000000a"}
    family_name           {"堂本"}
    first_name            {"陸"}
    family_name_katakana  {"ドウモト"}
    first_name_katakana   {"リク"}
    birthday              {"1995-09-29"}
  end
end