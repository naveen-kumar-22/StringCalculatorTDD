class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.gsub!("\n", ",")
    numbers.split(",").map(&:to_i).sum
  end
end
