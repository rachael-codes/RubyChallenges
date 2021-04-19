# RB 130 Ruby Challenges (deprecated) - Medium 1
# Program: Luhn Algorithm
# Date: 04/18/21

# INSTRUCTIONS
# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers,
# such as credit card numbers and Canadian Social Insurance Numbers.

# Example of how to works

# input of 8763 => 7733
# from right to left, every other number gets changed...
# 3 stays same                                 3
# 6 gets doubled to make 12 then 12-9 is...    3
# 7 stays same                                 7
# 8 gets doubled to make 16 then 16-9 is...    7
# 7 + 7 + 3 + 3 = 20 (the 'check sum')

# If checksum % 10 == 0, then the checksum is valid, else it's invalid

# Add a digit so the number in order to create a valid checksum

# PEDAC
# input: integer
# output: depends on the instance method

# Algo for addends, checksum, and valid
# -call digits on input integer to get an array of reversed digits
# -iterate over array w/ index + map for transformation
#  -if index is even
#    return num as-is
#  -else
#    -double the num, and if the doubled num is 10 or more, subtract 9
#      -return either the doubled num or the doubled num minus 9
# -reverse the digits so they're back in the right order (for addends method)
# -sum the array (for checksum method)
# -if sum % 10 == 0, return 'valid' else 'invalid' (for valid? method)

# Algo for create and make_valid
# -create an instance of the Luhn class + pass in the num to the constructor
# -if the num is valid, return it; else, make valid
# -within make_valid method, assign a "digit to add" variable to 0...
#  -add this number to the @reversed_digits in the constructor + convert to a regular num to check it...
#  -if this num is valid, break out; else, delete digit and replace with digit incremented by 1
#  -return new @num (using the getter method)

class Luhn
  attr_accessor :num, :reversed_digits

  def initialize(num)
    @num = num
    @reversed_digits = num.digits
  end

  def addends
    reversed_digits.map.with_index do |num, idx|
      next num unless idx.odd?

      num * 2 >= 10 ? num * 2 - 9 : num * 2
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(new_num)
    luhn_instance = Luhn.new(new_num)
    luhn_instance.valid? ? luhn_instance : luhn_instance.make_valid
  end

  def make_valid
    digit_to_add = 0
    loop do
      reversed_digits.unshift(digit_to_add)
      self.num = reversed_digits.reverse.join.to_i
      break if valid?

      reversed_digits.shift
      digit_to_add += 1
    end
    num
  end
end
