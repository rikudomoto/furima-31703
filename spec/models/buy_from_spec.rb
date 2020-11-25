require 'rails_helper'

RSpec.describe BuyFrom, type: :model do
  describe '配送先の情報の保存' do
    before do
      @buy_from = FactoryBot.build(:buy_from)
    end
    context "正常に登録できる場合 " do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@buy_from).to be_valid
    end
    it '建物がなくても登録できる' do
      @buy_from.building_name = '' 
      expect(@buy_from).to be_valid
    end
  end

    context "登録できない場合 "do
    it '郵便番号がないと保存できない' do
      @buy_from.postal_code = nil
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Postal code can't be blank", 'Postal code Please enter a hyphen')
    end
    it '都道府県が１の場合は保存できない' do
      @buy_from.shipping_area_id = 1
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include('Shipping area must be other than 1')
    end
    it '市区町村がないと保存できない' do
      @buy_from.municipality = nil
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地がないと保存できない' do
      @buy_from.address = nil
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号がないと保存できない' do
      @buy_from.phone_number = nil
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Phone number can't be blank", 'Phone number Figuresthe 11th digits')
    end
    it '郵便番号にハイフンがないと保存できない' do
      @buy_from.postal_code = 1111111
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include('Postal code Please enter a hyphen')
    end
    it '電話番号は11桁以内でハイフンは含まれると保存できない' do
      @buy_from.phone_number = '090-2222-2222'
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include('Phone number Figuresthe 11th digits')
    end
    it '電話番号が全角文字のみだと登録できない'do
      @buy_from.phone_number = '０９０１１１１１１１１'
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include('Phone number Figuresthe 11th digits')
    end
    it '電話番号が半角英語だと登録できない'do
      @buy_from.phone_number = 'ooooooooooo'
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Phone number Figuresthe 11th digits")
    end
    it '電話番号が半角数字＋半角英語混合だと登録できない'do
      @buy_from.phone_number = 'oooooo11111'
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Phone number Figuresthe 11th digits")
    end
    it 'tokenが空では登録できない事' do
      @buy_from.token = ''
      @buy_from.valid?
      expect(@buy_from.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end
