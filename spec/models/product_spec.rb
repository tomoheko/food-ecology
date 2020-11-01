require 'rails_helper'

RSpec.describe '商品出品機能', type: :system do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('/fruits.png')
  end
  context '商品出品機能がうまくいくとき' do
    it 'name, image, quantity, explanation, category_id, condition_id, prefecture_id, shipment_term_id, price, shipment_fee_idが存在すれば出品できる' do
      expect(@product).to be_valid
    end
  end

  context '商品出品機能がうまくいかないとき' do
    it 'nameが空だと登録できない' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'imageが空だと登録できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it 'quantityが空だと登録できない' do
      @product.quantity = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'explanationが空では登録できない' do
      @product.explanation = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")
    end
    it "category_idが' --- 'の時、つまりidが1では登録できない" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 1')
    end
    it "condition_idが' --- 'の時、つまりidが1では登録できない" do
      @product.condition_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Condition must be other than 1')
    end
    it "prefecture_idが' --- 'の時、つまりidが1では登録できない" do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it "shipment_term_idが' --- 'の時、つまりidが1では登録できない" do
      @product.shipment_term_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipment term must be other than 1')
    end
    it "shipment_fee_idが' --- 'の時、つまりidが1では登録できない" do
      @product.shipment_fee_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipment fee must be other than 1')
    end
    it 'priceが空では登録できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceの入力が全角だと登録できない' do
      @product.price = '５０００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end
  end
end
