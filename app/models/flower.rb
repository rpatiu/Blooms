class Flower < ApplicationRecord
  validates :name, :price, presence: true

  has_many :cart_items
  # belongs_to :category

  has_one_attached :image
end
