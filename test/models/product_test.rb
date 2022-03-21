require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save product without name' do
    product = Product.new(sku: 'u2u3', price: 30, stock: 40)
    assert_not product.save, 'Saved the product without a name'
  end

  test 'should not update product without price' do
    assert_not Product.first.update(price: nil), 'Saved the product without a price'
  end
end
