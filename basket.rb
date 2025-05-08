# this file is part of the checkout system, which is responsible for managing the shopping cart and calculating the total price of items in the basket.
class Basket
  def initialize(catalogue:, offers: [], delivery_rule:)
    @catalogue = catalogue
    @offers = offers
    @delivery_rule = delivery_rule
    @items = []
  end

  def add_product(code)
    product = @catalogue.fetch_product(code)
    raise ArgumentError, "Product with the given code: #{code} not found." unless product

    @items << product
  end


  def total_cart_details
    return { total_price: 0.0, delivery_charge: 0.0 } if @items.empty?

    discounted_items = @offers.inject(@items.dup) do |items, offer|
      result = offer.apply(items)
      result
    end

    subtotal = discounted_items.sum(&:price)
    delivery = @delivery_rule.calculate(subtotal)
    total_price = (subtotal + delivery).round(2)

    {
      total_price: total_price,
      delivery_charge: delivery.round(2),
    }
  end
end
