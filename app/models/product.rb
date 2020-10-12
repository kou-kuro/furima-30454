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

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day_ship
  validates :category_id, :prefecture_id, :status_id, :shipping_fee_id, :day_ship_id, numericality: { other_than: 1 } 

  
  validates :price, numericality: {greater_than: 300, less_than: 9999999}
  with_options presence: true, format: { with: /\A^[-]?[0-9]+(\.[0-9]+)?$\Z/} do
  validates :price


  end
end

