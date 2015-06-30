class Cart
  attr_accessor :cart, :base_price, :result

  def initialize(cart)
    @cart = cart || []
    @base_price = 8
    @@result = 0
  end

  def price
    return 0 if cart.empty?
    carts_hash = Hash.new(0)
    cart.each do |k|
      carts_hash[k] += 1
    end
    begin 
      single_carts = carts_hash.map do |k, v|
        if v >= 1
          carts_hash[k] -= 1
          k
        end
      end
      single_carts.delete(nil)
      array_calculator(single_carts)
    end while carts_hash.detect { |k, v| v >= 1 }
    @@result
  end

  def array_calculator(array)
    cart_discount = array.uniq.size
    @@result += cart_discount * base_price * price_calculator(cart_discount)
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