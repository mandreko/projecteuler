# Euler 63
# http://projecteuler.net/index.php?section=problems&id=63
# The 5-digit number, 16807=75, is also a fifth power. Similarly, the 9-digit number, 134217728=89, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?

require 'benchmark'

def numOfDigits?( num )
   num.to_s().size
end

time = Benchmark.realtime do
  total = 0

  for x in (1..9)
     for n in (1..21)
        temp = x ** n
        if n == numOfDigits?( temp )
           total = total + 1
           #puts x.to_s + "^" + n.to_s + " = " + temp.to_s
        end
     end
  end

  @answer = total.to_s
end
puts "Euler 63: #{@answer}\t#{time*1000} milliseconds"