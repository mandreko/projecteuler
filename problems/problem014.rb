# Euler 14
# http://projecteuler.net/index.php?section=problems&id=14
# The following iterative sequence is defined for the set of positive integers:
# 
# n  n/2 (n is even)
# n  3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

require 'benchmark'

class Seq
  @depth = {}

  def Seq.p14_sequence_depth(number)
    return 1 if number == 1
    return @depth[number] if @depth[number]
    if number % 2 == 0
      d = p14_sequence_depth(number/2) + 1
    else
      d = p14_sequence_depth((3*number) + 1) + 1
    end
    @depth[number] = d
    d
  end
end

time = Benchmark.realtime do
  max = 1
  @idx = 1
  (2..1_000_000).each do |i|
    l = Seq.p14_sequence_depth(i)
    if l > max
      max = l
      @idx = i
    end
  end
end
puts "Euler 14: #{@idx}\t#{time*1000} milliseconds"