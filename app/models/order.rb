class Order < ApplicationRecord
  validates :subtotal, :total, :status, presence: true
  validates :pst, :gst, :hst, :total, numericality: { greater_than_or_equal_to: 0}

  belongs_to :user
  has_many :cart_items
end
