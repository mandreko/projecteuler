# Euler 10
# http://projecteuler.net/index.php?section=problems&id=9
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

require 'benchmark'
require 'mathn'

time = Benchmark.realtime do
  @answer = Prime.each(2_000_000).inject(:+)
end
puts "Euler 10: #{@answer}\t#{time*1000} milliseconds"