require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき'
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは＠がないと登録できない' do
      @user.email = 'sample'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが重複すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password Password Include both letters and numbers')
    end
    it 'passwordは、6文字以上での入力をしないと登録できない' do
      @user.password = 'aaaa6'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角英数字で入力しないと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
    end
    it 'family_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid. Input full-width characters.')
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid. Input full-width characters.')
    end
    it 'family_nameが英語だと登録できない' do
      @user.family_name = 'domoto'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
    end
    it 'first_nameが英語だと登録できない' do
      @user.first_name = 'riku'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end
    it 'family_name_katakanaが空だと登録できない' do
      @user.family_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name katakana can't be blank", 'Family name katakana is invalid. Input full-width katakana characters.')
    end
    it 'first_name_katakanaが空だと登録できない' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank", 'First name katakana is invalid. Input full-width katakana characters.')
    end
    it 'family_name_katakanaが漢字だと登録できない' do
      @user.family_name_katakana = '堂本'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name katakana is invalid. Input full-width katakana characters.')
    end
    it 'first_name_katakanaが漢字だと登録できない' do
      @user.first_name_katakana = '陸'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name katakana is invalid. Input full-width katakana characters.')
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
