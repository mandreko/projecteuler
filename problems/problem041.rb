# Euler 41
# http://projecteuler.net/index.php?section=problems&id=41
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# 
# What is the largest n-digit pandigital prime that exists?

require 'benchmark'
require 'mathn'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/pandigital.rb'

time = Benchmark.realtime do
  
  largest_pandigital_prime = 0
     
     Prime.each do |prime|
       #puts prime
       
       if (prime.pandigital?)
         largest_pandigital_prime = prime
       end
       
       if prime > 7654321
         break
       end
       
     end
   
   @answer = largest_pandigital_prime
end
puts "Euler 41: #{@answer}\t#{time*1000} milliseconds"