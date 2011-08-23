# Euler 39
# http://projecteuler.net/index.php?section=problems&id=39
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions
# for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p  1000, is the number of solutions maximised?

require 'benchmark'

time = Benchmark.realtime do
  a = []
  high = 0
  high_num = 0

  1.upto 500 do |m|
    1.upto 500 do |n|
      if m < n
        z = m**2 + n**2

        if Math.sqrt(z) % 1 == 0
          a << m + n + Math.sqrt(z).to_i
        end
      end
    end
  end

  a.uniq.each do |p|
    if a.count(p) > high
      high = a.count(p)
      high_num = p
    end
  end

  @answer = high_num
end
puts "Euler 39: #{@answer}\t#{time*1000} milliseconds"