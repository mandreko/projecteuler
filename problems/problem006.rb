# Euler 6
# http://projecteuler.net/index.php?section=problems&id=6
# The sum of the squares of the first ten natural numbers is,
# 
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# 
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

require 'benchmark'

time = Benchmark.realtime do
  
  sum, variable = 0, 0 
  100.downto(1) { |x| sum+=x; variable += (x*x) } 
  sum_square = sum*sum 
  @answer = sum_square - variable
  
end
puts "Euler 6: #{@answer}\t#{time*1000} milliseconds"