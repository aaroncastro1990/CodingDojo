class Cart
  attr_accessor :cart, :base_price

  def initialize(cart)
    @cart = cart || []
    @base_price = 8
  end

  def price
    return 0 if cart.empty?
    result = 0

    cart_discount = cart.uniq.size
    cart_without_discount = cart.size - cart_discount

    result += cart_discount * base_price * price_calculator(cart_discount)
    result += cart_without_discount * base_price
  end

  def price_calculator(carts)
    if carts.eql?(2)
      0.95
    elsif carts.eql?(3)
      0.9
    elsif carts.eql?(4)
      0.8
    elsif carts >= 5
      0.75
    else
      1
    end
  end
end
   #
#   uniq_cart = cart.uniq
#   puts "uniq #{uniq_cart}"
#   puts "cart #{cart}"
#
#   if uniq_cart == cart
#
#     if uniq_cart.size.eql?(2)
#       base_price * uniq_cart.size * 0.95
#     end
#   else
#     cart.size * base_price
#   end
#
#  end