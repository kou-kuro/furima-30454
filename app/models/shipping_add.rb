class ShippingAdd < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_num
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_num
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A^\d{10}$|^\d{11}$\Z/ } do
    validates :phone_num
  end
  with_options presence: true, format: { with: /\A^\d{3}[-]\d{4}$\Z/ } do
    validates :post_num
  end
end
