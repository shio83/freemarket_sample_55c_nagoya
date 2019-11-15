class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :comments, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :buyer_id, class_name: 'SellerBuyer', foreign_key: 'buyer_id'
  has_many :seller_id, class_name: 'SellerBuyer', foreign_key: 'seller_id'

end
