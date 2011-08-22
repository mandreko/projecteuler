# Euler 9
# http://projecteuler.net/index.php?section=problems&id=9
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# 
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require 'benchmark'

def pythagorean_triple(hypotenuse)
  square = hypotenuse*hypotenuse
  triples = []
  (1...hypotenuse).to_a.reverse.each do |i|
   diff = square - (i*i)
   triples << [Math.sqrt(diff).to_i, i, hypotenuse] if Math.sqrt(diff) % 1 == 0.0
  end
  triples
end

def pythagorean_triple_from_sum(sum)
  start = 1
  (start...sum).each do |i|
    triples = pythagorean_triple(i)
    triples.each do |triple|
      return triple if triple && (triple.inject {|total, n| total + n }.to_i == sum)
    end
  end
  nil
end
    
time = Benchmark.realtime do
  @answer = pythagorean_triple_from_sum(1000).inject(1) {|product, i| product * i}
end

puts "Euler 9: #{@answer}\t#{time*1000} milliseconds"