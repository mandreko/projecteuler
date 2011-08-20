# Euler 22
# http://projecteuler.net/index.php?section=problems&id=22
#Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names,
#begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value
# by its alphabetical position in the list to obtain a name score.
#
#For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the
#938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
#
#What is the total of all the name scores in the file?

require 'benchmark'

time = Benchmark.realtime do
  @answer=0

  f = File.open File.expand_path(File.dirname(__FILE__)) + "/../inputs/problem022.txt"
  a = eval('[' + f.read + ']').sort
  f.close

  order = 0
  @answer = a.inject(0) do |r,n|
    order += 1
    val = 0
    n.each_byte { |b| val += b - 64 }
    r + order * val
  end

end
puts "Euler 22: #{@answer}\t#{time*1000} milliseconds"