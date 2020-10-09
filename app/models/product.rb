class Product < ApplicationRecord


  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_ship_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  
  validates :number,numericality: { only_integer: true,greater_than: 300, less_than: 9,999,999
  with_options presence: true, format: { with: /^[-]?[0-9]+(\.[0-9]+)?$/} do
  validates :price

  has_one_attached :image
  belongs_to :user
  has_one :purchase

end
