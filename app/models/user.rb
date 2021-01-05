class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # validates :email, uniqueness: { case_sensitive: false }
  # validates :email, uniqueness: true

  with_options presence: true do
    validates :nickname 
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end


