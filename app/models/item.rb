class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name 
    validates :comment
    validates :price

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
    
    
end