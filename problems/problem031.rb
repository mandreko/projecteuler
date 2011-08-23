# Euler 31
# http://projecteuler.net/index.php?section=problems&id=31
# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
#
# 1*£1 + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
# How many different ways can £2 be made using any number of coins?

require 'benchmark'

time = Benchmark.realtime do
  target = 200
  coins = [1, 2, 5, 10, 20, 50, 100, 200]
  ways = [1]

  coins.each {|coin|
    coin.upto(target + 1) {|i|
      ways[i] = (ways[i] || 0) + (ways[i - coin] || 0)
    }
  }

  @answer = ways[target]

end
puts "Euler 31: #{@answer}\t#{time*1000} milliseconds"