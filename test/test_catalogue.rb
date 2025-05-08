require 'minitest/autorun'
require_relative '../product'
require_relative '../catalogue'

class CatalogueTest < Minitest::Test
  def setup
    @products = [
      Product.new(code: 'R01', title: 'Red Widget', price: 32.95),
      Product.new(code: "B01", title: "Blue Widget", price: 7.95)
    ]
    @catalogue = Catalogue.new(@products)
  end

  def test_find_existing_product
    assert_equal @products[0], @catalogue.find('B01')
  end

  def test_find_nonexistent_product
    assert_nil @catalogue.find('G01')
  end
end
