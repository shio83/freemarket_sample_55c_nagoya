class SellerBuyer < ApplicationRecord
  belongs_to :buyer, class_name: "User", foreign_key: "buyer"
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
end
