# Ruby Challenges Easy 1
# Program: Sieve of Eratosthenes
# Date: 04/18/21

class Sieve
  def initialize(upto_num)
    @upto_num = upto_num
  end

  def primes
    (2..upto_num).to_a.select { |num| prime?(num) }
  end

  def prime?(num)
    n = 2
    while n < num
      return false if num % n == 0

      n += 1
    end
    true
  end

  private

  attr_reader :upto_nums
end
