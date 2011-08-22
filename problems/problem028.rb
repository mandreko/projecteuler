# Euler 28
# http://projecteuler.net/index.php?section=problems&id=28
# Starting with the number 1 and moving to the right in a
# clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

require 'benchmark'

def square_sum(n)
  #  # 4 corners:
  #  #n^2 - top right
  #  #n^2-n+1 - top left
  #  #n^2-2n+2 - bottom left
  #  #n^2-3n+3 - bottom right
  4* n**2 - 6*n + 6
end

time = Benchmark.realtime do
  @answer = (3..1001).step(2).inject(1){|sum, n| sum + square_sum(n)}
end

puts "Euler 28: #{@answer}\t#{time*1000} milliseconds"