# Euler 5
# http://projecteuler.net/index.php?section=problems&id=5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'rational'
require 'benchmark'

time = Benchmark.realtime do
  @num = (1..20).inject(1) { |result, n| result.lcm n }  
end

puts "Euler 5: #{@num}\t#{time*1000} milliseconds"

