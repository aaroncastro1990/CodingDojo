class Cart
  attr_accessor :cart, :base_price

  def initialize(cart)
    @cart = cart || []
    @base_price = 8
  end

  def price
   return 0 if cart.empty?
   uniq_cart = cart.uniq
   puts "uniq #{uniq_cart}"
   puts "cart #{cart}"

   if uniq_cart == cart

     if uniq_cart.size.eql?(2)
       base_price * uniq_cart.size * 0.95
     end
   else
     cart.size * base_price
   end

  end
end