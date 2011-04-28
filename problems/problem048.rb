# Euler 48
# http://projecteuler.net/index.php?section=problems&id=48
# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
# 
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

require 'benchmark'

time = Benchmark.realtime do
  @answer = 1.upto(1000).inject {|sum, n| sum + n**n}.to_s[-10, 10]
end
puts "Euler 48: #{@answer}\t#{time*1000} milliseconds"