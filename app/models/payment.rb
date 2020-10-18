class Payment
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :address, :building, :phone_num, :purchase_id, :user_id, :product_id, :token, :authenticity_token

  with_options presence: true, format: { with: /\A^\d{3}[-]\d{4}$\Z/ } do
    validates :post_num
  end

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :token
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A^\d{10}$|^\d{11}$\Z/ } do
    validates :phone_num
  end

  def save
    @purchase = Purchase.create!(user_id: user_id, product_id: product_id)
    ShippingAdd.create!(purchase_id: @purchase.id, post_num: post_num, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num)
  end
end
