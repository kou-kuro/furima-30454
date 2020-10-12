require 'rails_helper'
RSpec.describe Product, type: :model do
describe Product do
  before do
    @product = FactoryBot.build(:product)
  end
    context '投稿がうまくいくとき' do
      it "imageとtilteとdescriptionとcategory_idとstatus_idとshipping_fee_idとprefecture_idとday_ship_idとpriceがあれば保存できる" do
        expect(@product).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'titleが空の時は登録できない' do
        @product.title = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空の時は登録できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空の時は登録できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it 'status_idが空の時は登録できない' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status is not a number")
      end
      it 'shipping_fee_idが空の時は登録できない' do
        @product.shipping_fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee is not a number")
      end
      it 'prefecture_idが空の時は登録できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture is not a number")
      end    
      it 'day_ship_idが空の時は登録できない' do
        @product.day_ship_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Day ship is not a number")
      end
      it 'priceが空の時は登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より低い価格では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999より高い価格では登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'idが1の時は登録できない' do
        @product.day_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day ship must be other than 1")
      end
    end
    end
  end