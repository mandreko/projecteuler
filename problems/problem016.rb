# Euler 16
# http://projecteuler.net/index.php?section=problems&id=16
#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
#What is the sum of the digits of the number 2^1000?

require 'benchmark'

time = Benchmark.realtime do
  @answer = (2**1000).to_s.split(//).inject(0) { |sum, n| sum + n.to_i}
end
puts "Euler 16: #{@answer}\t#{time*1000} milliseconds"