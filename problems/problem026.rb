# Euler 26
# http://projecteuler.net/index.php?section=problems&id=26
# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to
# 10 are given:
#
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring
# cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

require 'benchmark'
require 'mathn'

# http://mathforum.org/library/drmath/view/69422.html
# http://en.wikipedia.org/wiki/Repeating_decimal#Cyclic_numbers
def recurring_cycle_length(n)
  return 0 if n % 2 == 0 or n % 5 == 0
  i = 1
  until (((10**i) - 1) % n) == 0
    i += 1
  end
  i
end

time = Benchmark.realtime do

  num = 0
  max_length = 0
  Prime.each { |x|
    break if x >= 1_000
    length = recurring_cycle_length(x)
    num, max_length = x, length if length > max_length
  }

  @answer = num
  #@answer = (1..999).max { |x, y| recurring_cycle_length(x) <=> recurring_cycle_length(y)}

end
puts "Euler 26: #{@answer}\t#{time*1000} milliseconds"