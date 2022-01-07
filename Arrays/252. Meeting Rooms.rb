require 'pry'

def can_attend_meetings(intervals)
  return true if intervals.empty?
  return true if intervals.length <= 1

  intervals.sort!

  intervals.each_with_index do |interval, idx|
    break if idx == intervals.length - 1
    return false if (intervals[idx+1][0] < interval[1])
  end

  true
end

p can_attend_meetings([[7,10],[2,4]]) == true
