require_relative './product'
require_relative './catalogue'
require_relative './basket'
require_relative './offers/buy_one_half_off'
require_relative './delivery/delivery_discount'


# Current Products
products = [
  Product.new(code: "R01", title: "Red Widget", price: 32.95),
  Product.new(code: "G01", title: "Green Widget", price: 24.95),
  Product.new(code: "B01", title: "Blue Widget", price: 7.95)
]

catalogue = Catalogue.new(products)
offers = [BuyOneHalfOff.new("R01")]
delivery_rule = DeliveryDiscount.new

basket = Basket.new(
  catalogue: catalogue,
  offers: offers,
  delivery_rule: delivery_rule
)

puts "Welcome to Acme Widget Co!"
puts "Available products:"

products.each_with_index do |p, index|
  puts "#{index + 1}. #{p.code}: #{p.title} - $#{'%.2f' % p.price}"
end
puts '4. Checkout'
puts "\nSpecial Offer: Buy one Red Widget, get the second one at half price!"
puts "Delivery charges apply: $4.95 for orders under $50, $2.95 for orders between $50 and $90, free for orders over $90."
loop do
  print "\nEnter product number to add to basket (or type 'done' to checkout): "
  input = gets.chomp.upcase

  break if input == "4"

  begin
    if input == '1'
      product = catalogue.fetch_product('R01')
    elsif input == '2'
      product = catalogue.fetch_product('G01')
    elsif input == '3'
      product = catalogue.fetch_product('B01')
    else
      puts "Invalid input. Please enter a valid product number."
      next
    end
    basket.add_product(product.code)
    puts "Added #{product.title} to basket."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end


if basket.total_cart_price.zero?
  puts "Your basket is empty. Total: $0.00"
else
  puts "Total: $#{'%.2f' % basket.total_cart_price}"
end
