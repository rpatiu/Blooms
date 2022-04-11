class Province < ApplicationRecord
  validates :name, :pst, :hst, presence: true
  validates :pst, :gst, :hst, numericality: { greater_than_or_equal_to: 0}

  has_many :customers
end
