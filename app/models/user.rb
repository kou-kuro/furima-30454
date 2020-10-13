class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birthday_id, presence: true

  has_many :products
  has_many :purchases

  devise :validatable, password_length: 6..128
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :firstname
    validates :lastname
  end

  with_options presence: true, format: { with: /\A^([ァ-ン]|ー)+$\z/ } do
    validates :firstname_kana
    validates :lastname_kana
  end
end
