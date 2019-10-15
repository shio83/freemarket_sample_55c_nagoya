class SellerBuyer < ApplicationRecord
  belongs_to :buyer_id, class_name: "User"
  belongs_to :saler_id, class_name: "User"
end
