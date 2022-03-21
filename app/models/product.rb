class Product < ApplicationRecord
  validates :sku, :name, :price, presence: { message: '%{attribute} must always be specified for %{model}' }
  has_many :order_lines
  has_many :orders, through: :order_lines
  has_many :customers, through: :orders
  scope :sort_by_price, -> { order(:price) }
  scope :most_purchased, -> { unscoped.joins(:order_lines).group(:id).order('sum(order_lines.quantity) desc').limit(1) }
  scope :name_contains_words_greater_than_two_letters, -> { where('name ~ \'^\w{3,}(\s\w{3,})*$\'') }
  default_scope { order(:name) }
end
