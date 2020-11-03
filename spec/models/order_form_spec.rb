require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '寄付情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid
    end
  
    it "tokenが空では登録できないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_form.postal_code  = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeに"-"が入っていないと保存できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "prefecture_idが' --- 'の時、つまりidが1では登録できない" do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_form.house_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("House number can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @order_form.building = nil
      expect(@order_form).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input half-width characters.")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @order_form.phone_number = '090-1234-56789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end