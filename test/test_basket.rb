require 'minitest/autorun'
require_relative '../product'
require_relative '../catalogue'
require_relative '../basket'
require_relative '../offers/buy_one_half_off'
require_relative '../delivery/delivery_discount'

class BasketTest < Minitest::Test
  def setup
    @products = [
      Product.new(code: 'R01', title: 'Red Widget', price: 32.95),
      Product.new(code: 'B01', title: 'Blue Widget', price: 7.95)
    ]
    @catalogue = Catalogue.new(@products)
    @offers = [BuyOneHalfOff.new('R01')]
    @delivery_rule = DeliveryDiscount.new
    @basket = Basket.new(
      catalogue: @catalogue,
      offers: @offers,
      delivery_rule: @delivery_rule
    )
  end

  def test_total_with_no_offers
    @basket.add_product('B01')
    @basket.add_product('B01')
    assert_in_delta 20.85, @basket.total_cart_price, 0.01
  end

  def test_total_with_offer_applied
    @basket.add_product('R01')
    @basket.add_product('R01')
    assert_in_delta 54.37, @basket.total_cart_price, 0.02
  end

  def test_invalid_product_raises_error
    assert_raises(ArgumentError) { @basket.add_product('XYZ') }
  end
end
