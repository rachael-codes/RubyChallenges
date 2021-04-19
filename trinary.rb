# RB130 - Ruby Challenges (Deprecated) - Easy 1
# Program: Trinary
# Date: 04/18/21

# INSTRUCTIONS
# Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its
# decimal equivalent using first principles (without using an existing method or library that can work
# with numeral systems).

# to_decimal ALGORITHM
# convert num into digits + iterate over digits w/ index and map
# transform into 3 to the index power times the number
# return sum

class Trinary
  def initialize(num)
    valid?(num) ? @num = num.to_i : 0
  end

  def to_decimal
    num.to_i.digits.map.with_index { |num, idx| 3**idx * num }.sum
  end

  private

  def valid?(num)
    num.to_i.to_s == num
  end

  attr_reader :num
end
