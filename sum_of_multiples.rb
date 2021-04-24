# Program: Sum of Multiples
# Date: 04/12/21

# Write a program that, given a natural number and a set of one or more other numbers, can find the
# sum of all the multiples of the numbers in the set that are less than the first number.
# If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of
# either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# My solution
class SumOfMultiples
  attr_reader :target_nums

  def self.to(number)
    self.new.to(number)
  end

  def initialize(*nums)
    @target_nums = (nums.size > 0) ? nums : [3, 5]
  end

  def to(number)
    multiples = []
    dividend = number - 1

    while divisor > 0
      target_nums.any? { |num| multiples << dividend if dividend % num == 0 }
      dividend -= 1
    end

    multiples.sum
  end
end

# Re-done using 'upto' method
class SumOfMultiples
  def initialize(*nums)
    nums.empty? ? @nums = [3, 5] : @nums = nums
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  def to(upto_num)
    arr = []
    1.upto(upto_num - 1) do |n|
      @nums.any? { |num| arr << n if n % num == 0 }
    end
    arr.sum
  end
end

# LS solution
class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end
