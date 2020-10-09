FactoryBot.define do
  factory :user do
    # nickname  {Faker::Name.initials}
    # email     {Faker::Internet.free_email}
    # password  {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    # firstname  {Faker::person.first.kanji}
    # lastname   {Faker::person.last.kanji}
    # firstname_kana {Faker::person.first.katakana}
    # lastname_kana  {Faker::person.last.katakana}
    # brithday_id       {Faker::Date}
    # nickname  {"abe"}
    # email     {"kkk@gmail.com"}
    # password  {"00000aa"}
    # password_confirmation {password}
    # firstname  {"阿部"}
    # lastname   {"隆"}
    # firstname_kana {"アベ"}
    # lastname_kana  {"タカシ"}
    # brithday       {"2000/01/01"}

      nickname              {Faker::Name.initials}
      email                 {Faker::Internet.email }
      password              { "000000a" }
      password_confirmation { password }
      firstname            { "ぜんかく" }
      lastname             { "ぜんかく" }
      firstname_kana            { "ゼンカクカナ" }
      lastname_kana             { "ゼンカクカナ" }
      birthday_id              { "2020-01-01" }

  end
end