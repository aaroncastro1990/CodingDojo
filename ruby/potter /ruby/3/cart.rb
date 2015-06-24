class Cart
  attr_accessor :cart, :base_price


  def initialize(cart)
    @cart = cart || []
    @base_price = 8
  end

  def price
   return 0 if cart.empty?
   cart.size * base_price
  end
end