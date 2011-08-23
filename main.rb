require 'benchmark'

time = Benchmark.realtime do
  Dir["problems/*.rb"].each{|s| load s}
end
puts "-- All Problems --:\t#{time*1000} milliseconds"
