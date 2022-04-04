class Order < ApplicationRecord
  validates :subtotal, :pst, :gst, :hst, :total, :status, presence: true
  validates :pst, :gst, :hst, :total, numericality: { greater_than_or_equal_to: 0}

  belongs_to :customer
  has_many :cart_items
end
