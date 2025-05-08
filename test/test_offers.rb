require 'minitest/autorun'
require_relative '../offers/buy_one_half_off'
require_relative '../product'

class OfferTest < Minitest::Test
  def test_half_price_applied
    product = Product.new(code: 'R01', title: 'Red Widget', price: 32.95)
    offer = BuyOneHalfOff.new('R01')
    discount = offer.apply([product, product])
    assert_in_delta 16.475, discount, 0.01
  end

  def test_offer_not_applicable
    product = Product.new(code: 'B01', title: 'Blue Widget', price: 7.95)
    offer = BuyOneHalfOff.new('R01')
    discount = offer.apply([product])
    assert_equal 0.0, discount
  end
end
