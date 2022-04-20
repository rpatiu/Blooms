class CartItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :flower

  validates :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
end
