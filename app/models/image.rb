class Image < ApplicationRecord
  belongs_to :product, inverse_of: :images
  mount_uploaders :url, ImageUploader

  validates      :url,            presence: true, length: {maximum: 10}
end


