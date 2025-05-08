# this file defines a simple product class.
class Product
  attr_reader :code, :title, :price

  def initialize(code:, title:, price:)
    @code = code
    @title = title
    @price = price
  end
end
