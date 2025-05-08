require_relative '../interfaces/delivery_rule'

class DeliveryDiscount < DeliveryRule
  def calculate(subtotal)
    if subtotal < 50
      4.95
    elsif subtotal < 90
      2.95
    else
      0.0
    end
  end
end
