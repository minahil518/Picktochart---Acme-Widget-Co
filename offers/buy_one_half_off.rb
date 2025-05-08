require_relative '../interfaces/offer_strategy'
require_relative '../product'

class BuyOneHalfOff < OfferStrategy
  def initialize(target_code)
    @target_code = target_code
  end

  def apply(products)
    grouped_products = products.group_by(&:code)
    updated_products = products.dup

    eligible_products = grouped_products[@target_code]&.sort_by(&:price) || []
    half_price_count = eligible_products.size / 2

    half_price_items = eligible_products.first(half_price_count)

    half_price_items.each do |item|
      idx = updated_products.index(item)
      updated_products.delete_at(idx)
      updated_products << Product.new(code: item.code, title: item.title, price: item.price / 2)
    end
    updated_products
  end
end
