class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
  
    delimiter = ","
    if numbers.start_with?("//")
      new_line_index = numbers.index("\n")
      delimiter = numbers[2...new_line_index]
      numbers = numbers[(new_line_index + 1)..]
    end
  
    numbers.gsub!("\n", delimiter)
    numbers.split(delimiter).map(&:to_i).sum
  end
end
