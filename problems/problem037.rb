# Euler 37
# http://projecteuler.net/index.php?section=problems&id=37
# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, 
# and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
# 
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
# 
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
require 'benchmark'
require 'mathn'
require '../lib/prime.rb'

time = Benchmark.realtime do
  
  truncatable_primes = []
  count = 0
  
  Prime.each do |prime|
    
    # Don't use 2,3,5,7 - just skip the loop
    if (prime == 2 || prime == 3 || prime == 5 || prime ==7)
      next
    end
    
    if prime.truncatable?
      truncatable_primes << prime
    end
    
    if truncatable_primes.count == 11
      break
    end
    
  end
  
  @answer = truncatable_primes.inject(:+)
  
end
puts "Euler 37: #{@answer}\t#{time*1000} milliseconds"