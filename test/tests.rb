require_relative '../src/number/big_number'
require 'test/unit'

class NumberTest < Test::Unit::TestCase

  def setup
    @big_number1 = BigNumber.new([0, 1, 0, 1, 0, 1])
    @big_number2 = BigNumber.new([1, 1, 1, 0, 1, 1, 1, 0, 1])
    @big_number3 = BigNumber.new([0, 1])
    @big_number4 = BigNumber.new([1, 1])
  end

  def test_addition

    result = @big_number1 + @big_number2

    assert_equal('100001011', result.to_s)

    result = @big_number3 + @big_number4

    assert_equal('101', result.to_s)

    result = @big_number3 + @big_number3

    assert_equal('001', result.to_s)
  end

  def test_multipilication

    result = @big_number1 * @big_number2

    assert_equal('01100001101111', result.to_s)

    result = @big_number3 * @big_number3

    assert_equal('001', result.to_s)
  end

  def test_unchange_objects

    result = @big_number1 + @big_number2

    assert_equal('010101', @big_number1.to_s)
    assert_equal('111011101', @big_number2.to_s)

    result = @big_number3 * @big_number3

    assert_equal('01', @big_number3.to_s)
  end

  def test_subtraction

    result = @big_number2 - @big_number1

    assert_equal('101100101', result.to_s)

    result = @big_number4 - @big_number3

    assert_equal('1', result.to_s)

  end

end