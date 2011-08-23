# Euler 42
# http://projecteuler.net/index.php?section=problems&id=42
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values
# we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle 
# number then we shall call the word a triangle word.
# 
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common 
# English words, how many are triangle words?

require 'benchmark'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/integer_shapes.rb'

@letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

def score(word)
  score = 0
  word.chars.to_a.each do |i|
    score = score + @letters.index(i.capitalize) + 1
  end
  score
end

def triangle_word?(word)
  score = score(word)
  index = 0
  triangle_value = 0
  until triangle_value > score do
    if (triangle_value == score)
      return true
    end
    triangle_value = index.triangular
    index = index + 1
  end
  false
end

time = Benchmark.realtime do
  count = 0
  File.open(File.expand_path(File.dirname(__FILE__)) + "/../inputs/problem042.txt", "r") do |infile|
    infile.lines(",").each do |i|
      i.gsub!(/[",]/, "")
      if triangle_word?(i)
        count = count + 1
      end
    end
  end
  
  @answer = count
  
end
puts "Euler 41: #{@answer}\t#{time*1000} milliseconds"