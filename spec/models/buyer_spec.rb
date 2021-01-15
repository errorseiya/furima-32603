require 'rails_helper'

RSpec.describe Buyer, type: :model do
  describe "商品購入機能" do
    before do
      user =  FactoryBot.create(:user)
      item =  FactoryBot.create(:item)
      @buyer = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end
  
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer).to be_valid
      end
    
      it 'building_nameが空でも保存できること' do
        @buyer.building_name = ""
        expect(@buyer).to be_valid
      end
    end
    
    
    context '商品購入がうまくいかないとき' do
      it "user_idが空だと保存できないこと" do
        @buyer.user_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "User can't be blank"
      end
    
      it "item_idが空では保存できないこと" do
        @buyer.item_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Item can't be blank"
      end
    
      it "tokenが空では保存できないこと" do
        @buyer.token = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Token can't be blank"
      end
    
    
      it "postal_codeが空では保存できないこと" do
        @buyer.postal_code = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Postal code can't be blank"
      end
      it "postal_codeにハイフンが含まれない場合、保存できないこと" do
        @buyer.postal_code = "1234567"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Postal code is invalid. Include hyphen(-) or  please enter in half-width numbers"
      end
      it "postal_codeが全角では保存できないこと" do
        @buyer.postal_code = "１１１-１１１１"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Postal code is invalid. Include hyphen(-) or  please enter in half-width numbers"
      end
      it "postal_codeが文字では保存できないこと" do
        @buyer.postal_code = "aaa-bbbb"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Postal code is invalid. Include hyphen(-) or  please enter in half-width numbers"
      end
    
    
      it "prefecture_idが空では保存できないこと" do
        @buyer.prefecture_id= ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "prefecture_idが0では保存できないこと" do
        @buyer.prefecture_id = '0'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Prefecture must be other than 0"
      end
    
    
    
      it 'municipalityが空だと保存できないこと' do
        @buyer.municipality = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Municipality can't be blank")
      end
    
    
      it 'addressが空だと保存できないこと' do
        @buyer.address = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Address can't be blank")
      end

      
      it 'phone_numberが空だと保存できないこと' do
        @buyer.phone_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角だと保存できないこと' do
        @buyer.phone_number = "０９０１２３４５６７８"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include hyphen(-) or  please enter in half-width numbers")
      end

      it 'phone_numberが12行以上だと保存できないこと' do
        @buyer.phone_number = "090123456789"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include hyphen(-) or  please enter in half-width numbers")
      end

      it 'postal_codeが文字では保存できないこと' do
        @buyer.phone_number = "aaabbbcccdd"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include hyphen(-) or  please enter in half-width numbers")
      end       
    end
  end
end
