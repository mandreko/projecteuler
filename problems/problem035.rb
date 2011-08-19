# Euler 35
# http://projecteuler.net/index.php?section=problems&id=35
#The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
#There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
#How many circular primes are there below one million?

require 'benchmark'
require '../lib/prime'

time = Benchmark.realtime do
  @answer = 0
  Prime.each { |i|
    break if i >= 1_000_000
    @answer += 1 if i.is_circular_prime?
  }

end
puts "Euler 35: #{@answer}\t#{time*1000} milliseconds"