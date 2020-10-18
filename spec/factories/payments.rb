FactoryBot.define do
  factory :payment do
    token { 'tok_abcdefghijk00000000000000000' }
    post_num { '000-0000' }
    prefecture_id { 2 }
    city     {'あいうえお'}
    address  {'あいう1-1-1'}
    phone_num {'00000000000'}
    # user_id { 6 }
    # product_id { 7 }
  end
end
