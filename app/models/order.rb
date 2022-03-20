class Order < ApplicationRecord
  enum order_status: { pending: 'pending', complete: 'complete', cancelled: 'cancelled' }, _prefix: true
  belongs_to :customer
  has_many :order_lines
end