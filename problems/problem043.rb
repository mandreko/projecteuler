# Euler 43
# http://projecteuler.net/index.php?section=problems&id=43
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
# 
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
# 
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.

require 'benchmark'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/pandigital.rb'

class Integer
  def interesting?
    self_str = self.to_s
    
    return (self_str[1,3].to_i % 2 == 0 &&
            self_str[2,3].to_i % 3 == 0 &&
            self_str[3,3].to_i % 5 == 0 &&
            self_str[4,3].to_i % 7 == 0 &&
            self_str[5,3].to_i % 11 == 0 &&
            self_str[6,3].to_i % 13 == 0 &&
            self_str[7,3].to_i % 17 == 0)
  end
end

time = Benchmark.realtime do
  
  @answer = (?0..?9).to_a.permutation(10).to_a.map(&:join).map(&:to_i).select(&:interesting?).inject(:+)
  
end
puts "Euler 43: #{@answer}\t#{time*1000} milliseconds"