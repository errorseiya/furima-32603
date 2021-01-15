class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buyer_id, :token

  
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-) or  please enter in half-width numbers" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end

  # 固定電話(10桁),携帯電話(11桁)の正規表現
  validates :phone_number, format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "is invalid. Include hyphen(-) or  please enter in half-width numbers" }

  def save
    # 各テーブルにデータを保存する処理を書く
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
  
end
