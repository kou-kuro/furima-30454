require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
# RSpec.describe User, type: model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationとfistnameとlastnameとfirstname_kanaとlastname_kanaとbirthdayが存在すれば登録できる" do
        # user = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000a"
        @user.password_confirmation = "000000a"
        expect(@user).to be_valid
      end
      it "passwordが英数混在していれば登録できる" do
        @user.password = "000000a"
        expect(@user).to be_valid
      end
   end
  end


  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが数字のみであれば登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが英語のみであれば登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "firstnameが空だと登録できない" do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it "lastnameが空だと登録できない" do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it "firstname_kanaが空だと登録できない" do
      @user.firstname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it 'firstname_kanaが半角カタカナでなければ登録できないこと' do
      @user.firstname_kana =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana 全角文字を使用してください")
    end
    it "lastname_kanaが空だと登録できない" do
      @user.lastname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end
    it 'lastname_kanaが半角カタカナでなければ登録できないこと' do
      @user.lastname_kana =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana 全角文字を使用してください")
    end
    it "birthday_idが空だと登録できない" do
      @user.birthday_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
