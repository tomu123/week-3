require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save customer without name' do
    customer = Customer.new(last_name: 'Komatsu', address: 'JP', phone: '5642514')
    assert_not customer.save, 'Saved the customer without a name'
  end
end
