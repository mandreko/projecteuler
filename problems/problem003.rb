# Euler 3
# http://projecteuler.net/index.php?section=problems&id=3
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

require 'mathn'
require 'benchmark'

time = Benchmark.realtime do
  @answer = 600_851_475_143.prime_division.last[0]
end
puts "Euler 3: #{@answer}\t#{time*1000} milliseconds"