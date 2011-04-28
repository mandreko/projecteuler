# Euler 48
# http://projecteuler.net/index.php?section=problems&id=48
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# 
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

require 'benchmark'

time = Benchmark.realtime do
  @answer = 1.upto(1000).inject {|sum, n| sum + n**n}.to_s[-10, 10]
end
puts "Euler 48: #{@answer}\t#{time*1000} milliseconds"