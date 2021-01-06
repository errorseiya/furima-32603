class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


  with_options presence: true do
    validates :name 
    validates :comment
    validates :price
  end
    
  with_options numericality: { other_than: 1 }  do
    validates :category_id, 
  end
    
end
