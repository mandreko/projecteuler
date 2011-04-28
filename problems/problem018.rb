# Euler 18
# http://projecteuler.net/index.php?section=problems&id=18
# By starting at the top of the triangle below and moving
# to adjacent numbers on the row below, the maximum total
# from top to bottom is 23.
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom of the triangle below:

# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

# NOTE: As there are only 16384 routes, it is possible to solve
# this problem by trying every route. However, Problem 67, is the
# same challenge with a triangle containing one-hundred rows; it
# cannot be solved by brute force, and requires a clever method! ;o)

require 'benchmark'

time = Benchmark.realtime do

  data = \
  "3
  7 4
  2 4 6
  8 5 9 3"
  
  data = \
  "75
  95 64
  17 47 82
  18 35 87 10
  20 04 82 47 65
  19 01 23 75 03 34
  88 02 77 73 07 63 67
  99 65 04 28 06 16 70 92
  41 41 26 56 83 40 80 70 33
  41 48 72 33 47 32 37 16 94 29
  53 71 44 65 25 43 91 52 97 51 14
  70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
  63 66 04 68 89 53 67 30 73 16 69 87 40 31
  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
  
  # Split on newline character
  rows = data.split("\n")
  
  # Split rows into two dimensions array and convert to int
  @triangle = rows.map { |x| x.split(" ") \
    .map { |x| x.to_i } }
  
  # Loop through each row of the triangle starting at the base.
  (@triangle.length - 1).downto(0) { |a|
    0.upto(a-1) { |b|
      # Get the maximum value for adjacent cells in current row.
      # Update the cell which would be one step prior in the path
      # with the new total. For example, compare the first two
      # elements in row 15. Add the max of 04 and 62 to the first
      # position of row 14.This provides the max total from row 14
      # to 15 starting at the first position. Continue to work up
      # the triangle until the maximum total emerges at the
      # triangle's apex.
      @triangle [a-1][b] += [@triangle [a][b], @triangle [a][b+1]].max
      # puts triangle [a-1][b]
    }
  }
  
  #puts triangle [0][0]
end
puts "Euler 18: #{@triangle [0][0]}\t#{time*1000} milliseconds"
