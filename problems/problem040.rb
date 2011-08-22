# Euler 40
# http://projecteuler.net/index.php?section=problems&id=40
# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000

require 'benchmark'

time = Benchmark.realtime do

  # Build a long string of the numbers 1 - 1 million
  # and convert to char array
  nums = ("1".."1000000").to_a.join.chars.to_a

  i, @answer = 1, 1
  while i <= 1000000
    # Get the product of all numbers which fall in a
    # power of 10 position
    @answer *= nums[i-1].to_i
    i*=10
  end

end
puts "Euler 40: #{@answer}\t#{time*1000} milliseconds"
