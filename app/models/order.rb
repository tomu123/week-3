class Order < ApplicationRecord
  enum order_status: { pending: 'pending', completed: 'completed', cancelled: 'cancelled' }, _prefix: true
  belongs_to :customer
  has_many :order_lines
end
