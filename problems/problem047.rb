# Euler 47
# http://projecteuler.net/index.php?section=problems&id=47
# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2  7
# 15 = 3  5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2²  7  23
# 645 = 3  5  43
# 646 = 2  17  19.
#
# Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?

require 'benchmark'
require "mathn"

time = Benchmark.realtime do
# 1.0/0.0 gives us infinity ;)
  @answer = (1..1.0/0.0).each_cons(4) { |g|
              break g if g.all? { |nbr| nbr.prime_division.length == 4 }
            }[0]
end
puts "Euler 47: #{@answer}\t#{time*1000} milliseconds"


