require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_add_empty_string_returns_zero
    assert_equal 0, @calculator.add("")
  end

  def test_add_single_number_returns_number
    assert_equal 1, @calculator.add("1")
  end

  def test_add_two_numbers_returns_sum
    assert_equal 3, @calculator.add("1,2")
  end

  def test_add_multiple_numbers_returns_sum
    assert_equal 6, @calculator.add("1,2,3")
  end

  def test_add_new_line_delimiter_returns_sum
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_add_custom_delimiter_returns_sum
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_add_negative_number_throws_exception
    assert_raises(ArgumentError) { @calculator.add("-1,2") }
  end
  
  def test_add_multiple_negative_numbers_throws_exception_with_all_negatives
    exception = assert_raises(ArgumentError) { @calculator.add("-1,-2,3") }
    assert_equal "negatives not allowed: -1, -2", exception.message
  end
end
