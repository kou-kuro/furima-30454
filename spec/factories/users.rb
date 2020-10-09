FactoryBot.define do
  factory :user do
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