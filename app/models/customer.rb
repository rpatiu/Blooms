class Customer < ApplicationRecord
  validates :username, :password, :role, :first_name, :last_name, :email, :address, presence: true

  belongs_to :province
end
