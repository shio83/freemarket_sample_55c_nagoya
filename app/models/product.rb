class Product < ApplicationRecord
  
  belongs_to :category
  has_many   :likes
  has_many   :images, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many   :comments
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true

  # enum state: {
  #   "---": 0, 新品未使用: 1, 未使用に近い: 2,目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6
  # }
  # enum shipping_fee: {
  #   "---": 0, "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2
  # }
  # enum shipping_date: {
  #   "---":0, "1~2で発送":1, "2~3で発送":2, "4~7で発送":3
  # }
  # enum shipping_region: {
  #   "---": 0,北海道: 1,青森県: 2,岩手県: 3,宮城県: 4,秋田県: 5,山形県: 6,福島県: 7,
  #   茨城県: 8,栃木県: 9,群馬県: 10,埼玉県: 11,千葉県: 12,東京都: 13,神奈川県: 14,
  #   新潟県: 15,富山県: 16,石川県: 17,福井県: 18,山梨県: 19,長野県: 20,
  #   岐阜県: 21,静岡県: 22,愛知県: 23,三重県: 24,
  #   滋賀県: 25,京都府: 26,大阪府: 27,兵庫県: 28,奈良県: 29,和歌山県: 30,
  #   鳥取県: 31,島根県: 32,岡山県: 33,広島県: 34,山口県: 35,
  #   徳島県: 36,香川県: 37,愛媛県: 38,高知県: 39,
  #   福岡県: 40,佐賀県: 41,長崎県: 42,熊本県: 43,大分県: 44,宮崎県: 45,鹿児島県: 46,沖縄県: 47
  # }

  enum state: {
    "新品未使用": 1, "未使用に近い": 2,"目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6
  }
  enum shipping_fee: {
    "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2
  }
  enum shipping_date: {
    "1~2で発送": 1, "2~3で発送": 2, "4~7で発送": 3
  }
  enum shipping_region: {
    北海道: 1,青森県: 2,岩手県: 3,宮城県: 4,秋田県: 5,山形県: 6,福島県: 7,
    茨城県: 8,栃木県: 9,群馬県: 10,埼玉県: 11,千葉県: 12,東京都: 13,神奈川県: 14,
    新潟県: 15,富山県: 16,石川県: 17,福井県: 18,山梨県: 19,長野県: 20,
    岐阜県: 21,静岡県: 22,愛知県: 23,三重県: 24,
    滋賀県: 25,京都府: 26,大阪府: 27,兵庫県: 28,奈良県: 29,和歌山県: 30,
    鳥取県: 31,島根県: 32,岡山県: 33,広島県: 34,山口県: 35,
    徳島県: 36,香川県: 37,愛媛県: 38,高知県: 39,
    福岡県: 40,佐賀県: 41,長崎県: 42,熊本県: 43,大分県: 44,宮崎県: 45,鹿児島県: 46,沖縄県: 47
  }

  validates      :name,            presence: true, on: :validates_product
  validates      :description,     presence: true, on: :validates_product
  validates      :size,            presence: true, on: :validates_product
  validates      :brand,           presence: true, on: :validates_product
  validates      :state,           presence: true, on: :validates_product
  validates      :shipping_fee,    presence: true, on: :validates_product
  validates      :shipping_region, presence: true, on: :validates_product
  validates      :shipping_date,   presence: true, on: :validates_product
  validates      :category_id,     presence: true, on: :validates_product
  validates      :price,           presence: true, on: :validates_product, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
