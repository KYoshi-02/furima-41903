require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザーが新規登録できるとき' do
      it '新規登録できる場合' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが新規登録できないとき' do
      it 'nick_nameが空だと登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end

      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '同じメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'メールアドレスには＠含めないと登録できない' do
        @user.email = 'test12.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it '確認用のパスワードとパスワードは一致していないと登録できない' do
        @user.password = 'test1234'
        @user.password_confirmation = 'sample123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワードは半角英数字６文字以上でないと登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '名字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it '名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it '名字が半角だと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it '名前が半角だと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it '名字（カタカナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it '名前（カタカナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it '名字がカタカナでないと登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it '名前がカタカナでないと登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it '誕生日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end

    context 'ユーザーがログインできるとき' do
      it 'メールアドレスとパスワードが正しければログインできる' do
        @user = FactoryBot.create(:user, email: 'test@example.com', password: 'test1234', password_confirmation: 'test1234')
        authenticated_user = User.find_for_authentication(email: 'test@example.com')
        expect(authenticated_user.valid_password?('test1234')).to be true
      end
    end

    context 'ユーザーがログインできないとき' do
      it 'メールアドレスが正しくないとき' do
        @user = FactoryBot.create(:user, email: 'test@example.com', password: 'test1234', password_confirmation: 'test1234')
        authenticated_user = User.find_for_authentication(email: 'wrong@example.com')
        expect(authenticated_user).to be_nil
      end

      it 'パスワードが正しくないとき' do
        @user = FactoryBot.create(:user, email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
        authenticated_user = User.find_for_authentication(email: 'test@example.com')
        expect(authenticated_user.valid_password?('wrongpassword')).to be false
      end
    end
  end
end
