class Customer < ApplicationRecord
  validates :first_name, :last_name, :address, :phone, presence: true
  has_many :orders
end
