# Euler 23
# http://projecteuler.net/index.php?section=problems&id=23
#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the
#sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum
#exceeds n.
#
#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of
#two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be
#written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even
#though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than
#this limit.
#
#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'benchmark'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/divisors.rb'

time = Benchmark.realtime do

  #(2..20).each {|i|
  #  puts "i:#{i}\t#{i.is_abundant?}"
  #}
  max = 28123
  abundant_numbers = (11..max).select { |n| n.is_abundant?}

  abundant_number_sums = []
  abundant_numbers.each do |x|
    abundant_numbers.each do |y|
      s = x+y
      break if s > max
      abundant_number_sums << s
    end
  end

  non_abundant_number_sums = (1..max).to_a - abundant_number_sums
  @answer = non_abundant_number_sums.inject(:+)

end
puts "Euler 23: #{@answer}\t#{time*1000} milliseconds"