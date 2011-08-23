# Euler 32
# http://projecteuler.net/index.php?section=problems&id=32
## We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example,
# the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1
# through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9
# pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

require 'benchmark'
require 'mathn'
require 'rational'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/divisors.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/pandigital.rb'

def test_two_and_three(n)
  n[0..1].join.to_i * n[2..4].join.to_i == n[5..9].join.to_i
end

def test_one_and_four(n)
  n[0..0].join.to_i * n[1..4].join.to_i == n[5..9].join.to_i
end

time = Benchmark.realtime do

  products = []
  (1..9).to_a.permutation(9) {|p| products << p[5..9].join.to_i if (test_one_and_four(p) || test_two_and_three(p)) }
  @answer = products.uniq.inject(:+)

end
puts "Euler 32: #{@answer}\t#{time*1000} milliseconds"