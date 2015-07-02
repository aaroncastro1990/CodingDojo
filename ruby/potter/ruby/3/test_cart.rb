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

  def test_simple_discounts
    assert_equal(8 * 2 * 0.95, Cart.new([0, 1]).price)
    assert_equal(8 * 3 * 0.9, Cart.new([0, 2, 4]).price)
    assert_equal(8 * 4 * 0.8, Cart.new([0, 1, 2, 4]).price)
    assert_equal(8 * 5 * 0.75, Cart.new([0, 1, 2, 3, 4]).price)
  end

  def testSeveralDiscounts
    assert_equal(8 + (8 * 2 * 0.95), Cart.new([0, 0, 1]).price)
    assert_equal(2 * (8 * 2 * 0.95), Cart.new([0, 0, 1, 1]).price)
    assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), Cart.new([0, 0, 1, 2, 2, 3]).price)
    assert_equal(8 + (8 * 5 * 0.75), Cart.new([0, 1, 1, 2, 3, 4]).price)
  end

  def testEdgeCases
    assert_equal(2 * (8 * 4 * 0.8), Cart.new([0, 0, 1, 1, 2, 2, 3, 4]).price)
    assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
      Cart.new([0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4]).price)
  end

  def testGivenExample
    assert_equal(51.20, Cart.new([0, 0, 1, 1, 2, 2, 3, 4]).price)
  end

end