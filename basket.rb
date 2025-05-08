# this file is part of the checkout system, which is responsible for managing the shopping cart and calculating the total price of items in the basket.
class Basket
  def initialize(catalogue:, offers: [], delivery_rule:)
    @catalogue = catalogue
    @offers = offers
    @delivery_rule = delivery_rule
    @items = []
  end

  def add_product(code)
    product = @catalogue.find(code)
    raise "Product with the given code: #{code} not found." unless product

    @items << product
  end

  def total_cart_price
    discounted_items = @offers.inject(@items.dup) do |items, offer|
      offer.apply(items)
    end

    subtotal = discounted_items.sum(&:price)
    delivery = @delivery_rule.apply(subtotal)
    (subtotal + delivery).round(2)
end
