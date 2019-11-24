class Image < ApplicationRecord
  belongs_to :product, inverse_of: :images
  mount_uploader :url, ImageUploader

  # validates      :url,            presence: true, length: {maximum: 10}
end


