require_relative "cart"
require "test/unit"

class TestPrice < Test::Unit::TestCase

  def test_price_basic
    assert_equal(0, Cart.new([]).price)
    assert_equal(8, Cart.new([0]).price)
    assert_equal(8, Cart.new([1]).price)
    assert_equal(8, Cart.new([2]).price)
    assert_equal(8, Cart.new([3]).price)
    assert_equal(8, Cart.new([4]).price)
    assert_equal(8 * 2 , Cart.new([0,0]).price)
    assert_equal(8 * 3, Cart.new([1,1,1]).price)
  end
end