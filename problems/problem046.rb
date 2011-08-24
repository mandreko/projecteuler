# Euler 46
# http://projecteuler.net/index.php?section=problems&id=46
# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice
# a square.
#
# 9 = 7 + 2*1^2
# 15 = 7 + 2*2^2
# 21 = 3 + 2*3^2
# 25 = 7 + 2*3^2
# 27 = 19 + 2*2^2
# 33 = 31 + 2*1^2
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

require 'benchmark'
require 'prime'

class Integer
  def odd_composite?
    self.odd? and !self.prime? and self != 1
  end

  def goldbach?
    Prime.each(self - 1).map {|p| Math.sqrt((self - p) / 2).tap {|x| break x == x.to_i } }.inject(:|)
  end
end

Composites = Enumerator.new {|x, i = -1|
  loop {
    next unless (i += 2).odd_composite?
    x << i
  }
}

time = Benchmark.realtime do
  @answer = Composites.each {|x| break x if !x.goldbach? }
end
puts "Euler 46: #{@answer}\t#{time*1000} milliseconds"
