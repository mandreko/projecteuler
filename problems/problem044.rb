# Euler 44
# http://projecteuler.net/index.php?section=problems&id=44
## Pentagonal numbers are generated by the formula, Pn=n(3n-1)/2. The first ten pentagonal numbers are:
#
# 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
#
# It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 - 22 = 48, is not pentagonal.
#
# Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference is pentagonal and D = |Pk - Pj|
# is minimised; what is the value of D?

require 'benchmark'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/integer_shapes.rb'

time = Benchmark.realtime do
  @answer = Pentagonal.take(3000).each_with_index.map {|p, i| Pentagonal.take(i).select {|q| (p + q).pentagonal? }.map {|q| p - q }.select(&:pentagonal?) }.flatten.min
end
puts "Euler 44: #{@answer}\t#{time*1000} milliseconds"