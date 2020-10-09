require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationとfistnameとlastnameとfirstname_kanaとlastname_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "passwordが英数混在していれば登録できる" do
        @user.password = "aaaaa00"
        expect(@user).to be_valid
      end
  end

  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "重複したemailが存在する場合登録できない" do
    end
    it "passwordが5文字以下であれば登録できない" do
    end
    it "passwordが数字のみであれば登録できない" do
    end
    it "passwordが英語のみであれば登録できない" do
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
    end
    it "firstnameが空だと登録できない" do
    end
    it "lastnameが空だと登録できない" do
    end
    it "firstname_kanaが空だと登録できない" do
    end
    it "lastname_kanaが空だと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
