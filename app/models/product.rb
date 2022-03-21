class Product < ApplicationRecord
  validates :sku, :name, :price, presence: { message: '%{attribute} must always be specified for %{model}' }
  has_many :order_lines
  has_many :orders, through: :order_lines
  has_many :customers, through: :orders
end
