class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buyer_id

  
  # ここにバリデーションの処理を書く
  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, numericality:  {only_integer: true, message: "is please enter in half-width numbers"}
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
  
end
