# Problem: Octal
# Date: 04/12/21

# My solution
class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if invalid_octal?(num)

    total = 0
    num.to_i.digits.each_with_index { |digit, idx| total += digit * 8**idx }
    total
  end

  private

  def invalid_octal?(num)
    num.match?(/[^0-7]/)
  end
end

# Refactored
class Octal
  def initialize(num)
    @num = num.match(/[^0-7]/) ? '0' : num
  end

  def to_decimal
    @num.chars.map(&:to_i).reduce { |sum, num| sum * 8 + num }
  end
end
