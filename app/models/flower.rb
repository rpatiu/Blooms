class Flower < ApplicationRecord
  validates :name, :price, presence: true
  has_many :cart_items
  belongs_to :category
end
