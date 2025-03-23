class StringCalculator
  def initialize
    @called_count = 0
  end

  def add(numbers)
    @called_count += 1
    return 0 if numbers.empty?
  
    delimiter = ","
    if numbers.start_with?("//")
      new_line_index = numbers.index("\n")
      delimiter = numbers[2...new_line_index]
      numbers = numbers[(new_line_index + 1)..]
    end
  
    numbers.gsub!("\n", delimiter)
    number_list = numbers.split(delimiter).map(&:to_i)
    negative_numbers = number_list.select { |n| n < 0 }
  
    raise ArgumentError, "negatives not allowed: #{negative_numbers.join(", ")}" unless negative_numbers.empty?
  
    number_list.sum
  end
  
  def get_called_count
    @called_count
  end
end
