require 'pry'

def merge(intervals)
  return [[]] if intervals.nil? || intervals.empty?
  return intervals if intervals.length <= 1

  intervals.sort_by! do |interval|
    interval[0]
  end

  result = [intervals[0]]

  intervals[1..-1].each do |interval|
    if interval[0] <= result[-1][1]
      result[-1][1] = [result[-1][1], interval[1]].max
    else
      result << interval
    end
  end

  result
end

input = [[1,3],[2,6],[8,10],[15,18]]
output = [[1,6],[8,10],[15,18]]
p merge(input) == output

input = [[1,4],[4,5]]
output = [[1,5]]
p merge(input) == output

input = [[1,4],[0,4]]
output = [[0,4]]
p merge(input) == output

input = [[1,4],[2,3]]
output = [[1,4]]
p merge(input) == output

input = [[1,4],[0,2],[3,5]]
output = [[0,5]]
p merge(input) == output
