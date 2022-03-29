class Province < ApplicationRecord
  validates :name, :pst, :hst, presence: true
  has_many :customers
end
