class Flower < ApplicationRecord

  has_many :cart_items
  belongs_to :category

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}

  has_one_attached :image
end
