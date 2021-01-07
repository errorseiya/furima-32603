class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name 
    validates :comment
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefecture
    
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefecture_id
  end
    
end
