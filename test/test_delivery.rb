require 'minitest/autorun'
require_relative '../delivery/delivery_discount'

class DeliveryDiscountTest < Minitest::Test
  def setup
    @rule = DeliveryDiscount.new
  end

  def test_delivery_fee_under_50
    assert_equal 4.95, @rule.calculate(25)
  end

  def test_delivery_fee_under_90
    assert_equal 2.95, @rule.calculate(62)
  end

  def test_delivery_fee_over_90
    assert_equal 0.0, @rule.calculate(200)
  end
end
