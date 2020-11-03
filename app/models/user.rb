class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,:birthday, presence: true
         validates :first_name,:last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} 
         validates :first_name_kana,:last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
         validates :password, presence: true, format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
end
