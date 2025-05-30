# This file defines a simple catalogue system for managing products.
class Catalogue
  def initialize(products)
    @products = products.index_by(&:code)
  end

  def fetch_product(code)
    @products[code]
  end
end

  class Array
    # A helper method that will convert an array of objects into a hash.
    def index_by
      map { |e| [yield(e), e] }.to_h
    end
  end