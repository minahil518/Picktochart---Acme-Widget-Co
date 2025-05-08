require_relative '../interfaces/delivery_rule'

class TieredDelivery < DeliveryRule
  def apply(subtotal)
    case subtotal
    when 0...50
      4.95
    when 50...90
      2.95
    else
      0.0
    end
  end
end
