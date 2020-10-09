FactoryBot.define do
  factory :user do
    nickname  {Faker::Name}
    email     {Faker::Internet.free_email}
    password  {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    firstname  {Faker::person.first.kanji}
    lastname   {Faker::person.last.kanji}
    firstname_kana {Faker::person.first.katakana}
    lastname_kana  {Faker::person.last.katakana}
    brithday       {Faker::Date}
  end
end