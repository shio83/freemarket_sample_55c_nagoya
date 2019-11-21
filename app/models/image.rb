class Image < ApplicationRecord
  has_many :products, inverse_of: :images
  mount_uploaders :image, ImageUploader
end
