# Euler 52
# http://projecteuler.net/index.php?section=problems&id=52
# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different
# order.
#
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

require 'benchmark'

class Integer
  def contains_multiplied_digits

    self_array = self.to_s.chars.to_a.sort!
    length = self_array.length

    6.downto(2).each do |i|
      multiplied = (self * i).to_s.chars.to_a

      #No need to search if the digits aren't the same length (why we started down from 6, instead of up from 2)
      if (multiplied.length != length)
        return false
      end
      if (self_array != multiplied.sort!)
        return false
      end
    end

    true
  end
end

time = Benchmark.realtime do

  count = 1
  until count.contains_multiplied_digits do
    count += 1
  end

  @answer = count
end
puts "Euler 52: #{@answer}\t#{time*1000} milliseconds"