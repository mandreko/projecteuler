# Euler 34
# http://projecteuler.net/index.php?section=problems&id=34
#145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
#Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
#Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require 'benchmark'
require '../lib/factorial.rb'

time = Benchmark.realtime do

  factorial_sums = []
  (3..50_000).each do |i|
    if i == i.factorial_sum
      factorial_sums << i
    end
  end

  @answer = factorial_sums.inject(:+)

end
puts "Euler 34: #{@answer}\t#{time*1000} milliseconds"