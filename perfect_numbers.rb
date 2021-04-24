# Program: Perfect Number
# Date: 04/12/21

# EXPLICIT
# Aliquiot sum = the sum of a number's divisors
# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.

# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# My first solution
class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num <= 0

    divisors = []
    divisor = num - 1
    while divisor > 0
      divisors << divisor if num % divisor == 0
      divisor -= 1
    end

    if divisors.sum == num
      'perfect'
    elsif divisors.sum > num
      'abundant'
    else
      'deficient'
    end
  end
end

# My improved solution
class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 1

    divisor_sum = get_sum_of_divisors(num)
    return 'perfect' if divisor_sum == num
    divisor_sum > num ? 'abundant' : 'deficient'
  end

  class << self
    private

    def self.get_sum_of_divisors(num)
      arr = []
      counter = num - 1
      while counter.positive?
        arr << counter if (num % counter).zero?
        counter -= 1
      end
      arr.sum
    end
end

# LS solution
class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1

    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self # #####see note below######
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end

# Even though it looks like we're creating a private method, the private method doesn't work on
# class methods -- it only works on instance methods. Fortunately, there is a way around that
# using the class << self idiom lets us operate on the class itself as an object; by adding a private
# instance method to the class object, we effectively create a private class method. Why this works
# isn't important at this stage, but it's a useful idiom to know.
