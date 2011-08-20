# Euler 50
# http://projecteuler.net/index.php?section=problems&id=50
# The prime 41, can be written as the sum of six consecutive primes:
# 
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'benchmark'
require 'mathn'

time = Benchmark.realtime do

  @answer = Prime.each(1_000_000).to_a.tap {|p| break p.each_with_index.map {|v, i| p[i..-1].inject([0, 0]){|(sum, max), n|
      break [sum, max] if sum + n > 1_000_000; sum += n; max += 1; [sum, max] } } }.select {|x| x[0].prime? }.sort {|a, b| a[1] <=> b[1] }.last[0]

end
puts "Euler 43: #{@answer}\t#{time*1000} milliseconds"