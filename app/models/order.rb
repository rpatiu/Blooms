class Order < ApplicationRecord
  validates :subtotal, :pst, :gst, :hst, :total, :status, presence: true
  belongs_to :customer
  has_many :cart_items
end
