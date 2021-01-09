require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品がうまくいくとき' do
      it "image, name, comment, category_id, condition_id, shipping_charge_id, prefecture_id, days_to_ship_id, priceが存在すれば商品出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと商品出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空では商品出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "commentが空では商品出品できない" do
        @item.comment = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Comment can't be blank"
      end

      it "category_idが空では商品出品できない" do
        @item.category_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "condition_idが空では商品出品できない" do
        @item.condition_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it "shipping_charge_idが空では商品出品できない" do
        @item.shipping_charge_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it "prefecture_idが空では商品出品できない" do
        @item.prefecture_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "days_to_ship_idが空では商品出品できない" do
        @item.days_to_ship_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end

      it "category_idのidが0では商品出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end
      it "condition_idのidが0では商品出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 0"
      end
      it "shipping_charge_idのidが0では商品出品できない" do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge must be other than 0"
      end
      it "prefecture_idのidが0では商品出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end
      it "days_to_ship_idのidが0では商品出品できない" do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship must be other than 0"
      end
      it "priceが空では商品出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "priceが、299以下では商品出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
   
      it "priceが、10,000,000以上では商品出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 9999999"
      end

      it "priceが半角数字以外では商品出品できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
