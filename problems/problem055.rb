# Euler 55
# http://projecteuler.net/index.php?section=problems&id=55
# If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
#
# Not all numbers produce palindromes so quickly. For example,
#
# 349 + 943 = 1292,
# 1292 + 2921 = 4213
# 4213 + 3124 = 7337
#
# That is, 349 took three iterations to arrive at a palindrome.
#
# Although no one has proved it yet, it is thought that some numbers, like 196, never produce a palindrome. A number
# that never forms a palindrome through the reverse and add process is called a Lychrel number. Due to the theoretical
# nature of these numbers, and for the purpose of this problem, we shall assume that a number is Lychrel until proven
# otherwise. In addition you are given that for every number below ten-thousand, it will either (i) become a palindrome
# in less than fifty iterations, or, (ii) no one, with all the computing power that exists, has managed so far to map it
# to a palindrome. In fact, 10677 is the first number to be shown to require over fifty iterations before producing a
# palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).
#
# Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is 4994.
#
# How many Lychrel numbers are there below ten-thousand?
#
# NOTE: Wording was modified slightly on 24 April 2007 to emphasise the theoretical nature of Lychrel numbers.

require 'benchmark'

class Integer
  def reverse
    self.to_s.reverse.to_i
  end
  def lychrel?(iterations=50)
    return true if iterations == 0

    sum = self + self.reverse
    sum == sum.reverse ? false : sum.lychrel?(iterations-1)
  end
end

time = Benchmark.realtime do

  lychrel_count = 0
  (1...10_000).each do |i|
    if i.lychrel?
      lychrel_count += 1
    end
  end

  @answer = lychrel_count

end
puts "Euler 55: #{@answer}\t#{time*1000} milliseconds"