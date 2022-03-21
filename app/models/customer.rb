class Customer < ApplicationRecord
  validates :first_name, :last_name, :address, :phone, presence: true
  has_many :orders
  has_many :order_lines, through: :orders
  has_many :products, through: :order_lines
  scope :orders_between_dates, ->(id, date_range) { find(id).orders.where(date: date_range) }
end
