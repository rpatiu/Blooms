class CartItem < ApplicationRecord
  validates :price, :quantity, presence: true
  belongs_to :order
  belongs_to :flower
end
