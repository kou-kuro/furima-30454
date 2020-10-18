require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @payment = FactoryBot.build(:payment)
  end
  describe '商品の購入' do
    context '商品購入がうまく行く時' do
      it 'tokenとpost_numとprefecture_idとcityとaddressとphone_numとuser_idとproduct_idが存在すれば登録できる' do
        expect(@payment).to be_valid
      end
      it 'post_numは(-)を含み7個の数字であれば登録できる' do
        @payment.post_num = '000-0000'
        expect(@payment).to be_valid
      end
      it 'phone_numは11文字以内の数字であれば登録できる' do
        @payment.phone_num = '00000000000'
        expect(@payment).to be_valid
      end
    end
  end

  context '商品購入がうまくいかない時' do
    it 'tokenが空である場合は登録できない' do
      @payment.token = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_numが空の時は登録できない' do
      @payment.post_num = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Post num can't be blank")
    end
    it 'post_numの数字が8文字の時は登録ができない' do
      @payment.post_num = '0000-0000'
      @payment.valid?
      expect(@payment.errors.full_messages).to include('Post num is invalid')
    end
    it 'post_numの数字が6文字の時は登録ができない' do
      @payment.post_num = '000-000'
      @payment.valid?
      expect(@payment.errors.full_messages).to include('Post num is invalid')
    end
    it 'prefecture_idが空の時は登録できない' do
      @payment.prefecture_id = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1の時は登録できない' do
      @payment.prefecture_id = 1
      @payment.valid?
      expect(@payment.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空の時は登録できない' do
      @payment.city = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空の時は登録できない' do
      @payment.address = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numが空の時は登録できない' do
      @payment.phone_num = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'phone_numが12文字以上では登録できない' do
      @payment.phone_num = '000000000000'
      @payment.valid?
      expect(@payment.errors.full_messages).to include('Phone num is invalid')
    end
  end
end
