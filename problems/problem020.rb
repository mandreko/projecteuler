# Euler 20
# http://projecteuler.net/index.php?section=problems&id=20
#n! means n  (n  1)  ...  3 * 2 * 1
#
#For example, 10! = 10 * 9  ...  3 * 2 * 1 = 3628800,
#and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
#Find the sum of the digits in the number 100!

require 'benchmark'
require '../lib/factorial.rb'

time = Benchmark.realtime do
  @answer = 100.factorial.to_s.split(//).inject(0) { |sum, n| sum + n.to_i}
end
puts "Euler 20: #{@answer}\t#{time*1000} milliseconds"