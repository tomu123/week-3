class Customer < ApplicationRecord
  validates :first_name, :last_name, :address, :phone, presence: true
  has_many :orders
  has_many :order_lines, through: :orders
  has_many :products, through: :order_lines
end
