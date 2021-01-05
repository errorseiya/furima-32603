require 'rails_helper'
# 否定形にしてitの文を記述する
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字混合であれば登録できる" do
        @user.password = "test00"
        @user.password_confirmation = "test00"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが一意性であること" do
        @user.save
        another_uer = FactoryBot.build(:user)
        another_uer.email = @user.email
        another_uer.valid?
        # binding.pry
        expect(another_uer.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
      end
      it "メールアドレスは、@を含む必要があること" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "パスワードは、6文字以上でなければ登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "パスワードは、半角アルファベットだけでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワードは、半角数字だけでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワード（確認用）が、空の場合登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "パスワードとパスワード（確認用）の値が一致しない場合登録できない" do
        @user.password_confirmation = "test12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_name（名字）が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_name（名字）が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_name（名前）が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name（名前）が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_name_kana（名字フリガナ）が空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kana（名字フリガナ）が全角（カタカナ）でないと登録できない" do
        @user.last_name_kana = "ﾊﾝｶｸﾌﾘｶﾞﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "first_name_kana（名前フリガナ）が空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kana（名前フリガナ）が全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = "ﾊﾝｶｸﾌﾘｶﾞﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "birthday（生年月日）が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end



