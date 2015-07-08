class Cart
  attr_accessor :cart, :base_price, :result

  def initialize(cart)
    @cart = cart || []
    @base_price = 8
    @@result = 0
  end

  def price
    return 0 if cart.empty?
    if cart.size.eql?(1)
      return base_price
    end
    begin
      new_array = []
      cart.delete_if do |k|
        !new_array.include?(k) ? new_array.push(k) : false
      end
      if cart.size.eql?(3) && new_array.size.eql?(5)
        cart.push(new_array.pop)
      end
      total_cost_calculator(new_array.uniq.size)
    end while !cart.empty?
    @@result
  end

  def total_cost_calculator(carts)
    @@result += [carts, base_price, price_calculator(carts)].compact.inject(:*)
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
    end
  end
end