require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '必要な情報を適切に入力すると、商品の出品ができる'
    it '全て記載して商品が出品される' do
      expect(@item).to be_valid
    end

    context '商品が出品できないとき'
    it '画像が一枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が必須であること' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.says_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Says to ship must be other than 1')
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid. Please write all numbers in half size')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Please write all numbers in half size')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Please write all numbers in half size')
    end
  end
end
