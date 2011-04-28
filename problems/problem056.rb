# Euler 56
# http://projecteuler.net/index.php?section=problems&id=56
# A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
# 
# Considering natural numbers of the form, ab, where a, b  100, what is the maximum digital sum?

require 'benchmark'

time = Benchmark.realtime do
  @max = 0
  1.upto(100) do |a|
    1.upto(100) do |b|
      # Get the product of the 2 numbers
      product = a ** b
      
      # Get the sum of the digits
      sum = product.to_s.split('').collect{|i| i.to_i}.inject { |num, n| num + n}
      
      if sum > @max
        @max = sum
      end
      #print "A: ", a, " B: ", b, " Product: ", product, " Sum of Product: ", sum, "\n"
    end
  end
end
puts "Euler 56: #{@max}\t#{time*1000} milliseconds"

