# Euler 49
# http://projecteuler.net/index.php?section=problems&id=49
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i)
# each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is
#  one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?

require 'benchmark'
require 'prime'

time = Benchmark.realtime do
  @answer = Prime.each {|a, b = (a + 3330), c = (a + 6660)|
              next if a == 1487 or !b.prime? or !c.prime?
              break [a, b, c].map(&:to_s).join if a.to_s.chars.to_a.permutation(4)
                                                  .map {|p| p.join.to_i }
                                                  .tap {|p| break false if !p.include?(b) or !p.include?(c) }
            }
end
puts "Euler 49: #{@answer}\t#{time*1000} milliseconds"
