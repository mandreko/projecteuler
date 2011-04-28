# Euler 1
# http://projecteuler.net/index.php?section=problems&id=1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#  
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'benchmark'

sum = 0
time = Benchmark.realtime do
    
    1000.times { |i|
      if i % 3 == 0 || i % 5 == 0
        sum += i
      end
    }
end
puts "Euler 1: #{sum}\t#{time*1000} milliseconds"