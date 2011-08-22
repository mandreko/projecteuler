# Euler 67
# http://projecteuler.net/index.php?section=problems&id=67
# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from
# top to bottom is 23.
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file
# containing a triangle with one-hundred rows.
#
# NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this
# problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over
# twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

require 'benchmark'

time = Benchmark.realtime do

  File.open(File.expand_path(File.dirname(__FILE__)) + "/../inputs/problem067.txt", "r") do |infile|
    # Split rows into two dimensions array and convert to int
    triangle = infile.readlines.map { |line| line.split(' ').map {|num| num.to_i } }

    # Loop through each row of the triangle starting at the base.
    (triangle.length - 1).downto(0) { |a|
      0.upto(a-1) { |b|
        # Get the maximum value for adjacent cells in current row.
        # Update the cell which would be one step prior in the path
        # with the new total. For example, compare the first two
        # elements in row 15. Add the max of 04 and 62 to the first
        # position of row 14.This provides the max total from row 14
        # to 15 starting at the first position. Continue to work up
        # the triangle until the maximum total emerges at the
        # triangle's apex.
        triangle[a-1][b] += [triangle[a][b], triangle[a][b+1]].max
        # puts triangle [a-1][b]
      }
    }

    @answer = triangle[0][0]
  end
end
puts "Euler 67: #{@answer}\t#{time*1000} milliseconds"