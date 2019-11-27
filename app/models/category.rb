class Category < ApplicationRecord
  has_many :category_sizes, dependent: :destroy
  has_many :sizes, through: :category_sizes
  has_ancestry
end
