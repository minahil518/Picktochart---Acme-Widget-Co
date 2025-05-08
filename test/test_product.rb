require 'minitest/autorun'
require_relative '../product'

class ProductTest < Minitest::Test
  def test_product_initialization
    product = Product.new(code: 'R01', title: 'Red Widget', price: 32.95)
    assert_equal 'R01', product.code
    assert_equal 'Red Widget', product.title
    assert_equal 32.95, product.price
  end
end
