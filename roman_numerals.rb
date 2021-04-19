# Program: Roman Numerals
# Date: 04/12/21

# INSTRUCTIONS
# Write some code that Roman numbers into their modern equivalent.
# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years.
# They invented concrete and straight roads and even bikinis.
# One thing they never discovered though was the number zero. This made writing and dating extensive
# histories of their exploits slightly more challenging, but the system of numbers they came up with is
# still in use today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M.
# Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

=begin
I stands for 1
V stands for 5
X stands for 10
L stands for 50
C stands for 100
D stands for 500
M stands for 1,000
We don't have to worry about numbers higher than 3,000.

Modern Roman numerals are written by expressing each digit of the number separately, starting with the left
most digit and skipping any digit with a value of zero.
=end

# input: integer
# output: string

ROMAN_NUMERALS = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

class RomanNumeral
  attr_accessor :integer

  def initialize(integer)
    @integer = integer
  end

  def to_roman
    roman_version = ''
    to_convert = integer

    ROMAN_NUMERALS.each do |k, v|
      multiplier, remainder = to_convert.divmod(v)
      if multiplier > 0
        roman_version += (k * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end
