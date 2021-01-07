class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name 
    validates :comment
    validates :price
  end

  validates :price, format: { with: /^[0-9]+$/, message: "Price Half-width number." } 
  validates_exclusion_of :price, in: 300..9999999, message: "This site is only for under 300 and over 9999999"

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
    
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
    
end