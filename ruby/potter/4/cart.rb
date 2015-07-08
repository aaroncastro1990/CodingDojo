class Cart
  attr_accessor :cart, :base_price, :result

  def initialize(cart)
    @cart = cart || []
    @base_price = 8
    @@result = 0
  end

  def price
    return 0 if cart.empty?
    if cart.length == 1
      array_calculator(cart.size)
    else
      begin
        new_array = []
        cart.delete_if do |k|
          unless new_array.include? k
            new_array.push k
          end
        end
        if cart.length == 3 && new_array.length == 5
          cart.push(5)
          new_array.pop
        end
        array_calculator(new_array.uniq.size)
      end while !cart.empty?
    end
    @@result
  end

  def array_calculator(carts)
    @@result += carts * base_price * price_calculator(carts)
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