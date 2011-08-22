# Euler 4
# http://projecteuler.net/index.php?section=problems&id=4
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

require 'benchmark'

def p4(m,n)
  until (m*n).to_s == (m*n).to_s.reverse
    m -= 1
  end
  return m*n
end

time = Benchmark.realtime do
  arr =[]
  999.downto(1) do |n|
    arr << p4(999,n)
  end
  @answer = arr.max
end
puts "Euler 4: #{@answer}\t#{time*1000} milliseconds"