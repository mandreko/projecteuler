# Euler 38
# http://projecteuler.net/index.php?section=problems&id=38
# Take the number 192 and multiply it by each of 1, 2, and 3:
#
# 192 * 1 = 192
# 192 * 2 = 384
# 192 * 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product
#  of 192 and (1,2,3)
#
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645,
# which is the concatenated product of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with
#  (1,2, ... , n) where n > 1?

require 'benchmark'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/pandigital.rb'

time = Benchmark.realtime do
  pandigital_numbers = []

  (1..10_000).each do |x| #Originally put in 333,333,333, since that was the max, but then narrowed it down
    (2..9).each do |y|
      concatenated_product = String.new
      (1..y).each do |z|
        concatenated_product += (x * z).to_s
      end
      if concatenated_product.length == 9 && concatenated_product.to_i.pandigital?
        pandigital_numbers << concatenated_product.to_i
      end
    end
  end

  @answer = pandigital_numbers.max

end
puts "Euler 38: #{@answer}\t#{time*1000} milliseconds"