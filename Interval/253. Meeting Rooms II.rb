require 'pry'

def min_meeting_rooms(intervals)
  return StandardError if intervals.empty? || intervals.nil?

  # Sort meetings by start time
  intervals.sort_by! do |interval|
    interval[0]
  end

  # First meeting occupies a room and
  # starts max meeting rooms at 1
  meeting_rooms = [intervals[0]]
  max_meeting_rooms = 1

  intervals[1..-1].each_with_index do |interval|
    current_start_time = interval[0]

    # 1. Remove meetings that have ended prior
    #    to current meeting start time
    meeting_rooms.delete_if do |meetings|
      meetings[1] <= current_start_time
    end

    # 2. Add current meeting to meeting rooms
    meeting_rooms << interval

    # 3. Update meeting room count if greater
    #    than previous
    if meeting_rooms.count > max_meeting_rooms
      max_meeting_rooms = meeting_rooms.count
    end
  end

  max_meeting_rooms
end

intervals = [[13,15],[1,13]]
intervals = [[1,13],[13,15]]
output = 1
p min_meeting_rooms(intervals) == output

intervals = [[0,30],[5,10],[15,20]]
output = 2
p min_meeting_rooms(intervals) == output
