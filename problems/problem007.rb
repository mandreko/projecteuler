# Euler 7
# http://projecteuler.net/index.php?section=problems&id=7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# 
# What is the 10001st prime number?

require 'benchmark'
require 'mathn'

time = Benchmark.realtime do
  
  primes = Prime.new
  10_000.times { primes.next }
  @answer = primes.next
  
end
puts "Euler 7: #{@answer}\t#{time*1000} milliseconds"