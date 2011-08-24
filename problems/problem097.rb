# Euler 97
# http://projecteuler.net/index.php?section=problems&id=97
## The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form
# 2^6972593-1; it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, of the form 2p1, have been found
#  which contain more digits.
#
# However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433*2^7830457+1.
#
# Find the last ten digits of this prime number.

require 'benchmark'

#http://en.wikipedia.org/wiki/Modular_exponentiation
def modular_exponentiation(a,b,m)
  b=b.to_s(2).reverse.split("").map{|c| c=="1"}
  acc=1
  while(b.length>0)
    c=b.shift
    acc=(acc*a)%m if c
    a=(a**2)%m
  end
  acc
end

time = Benchmark.realtime do
  @answer = (modular_exponentiation(2,7830457,10**10)*28433+1)%(10**10)
end
puts "Euler 97: #{@answer}\t#{time*1000} milliseconds"

