require 'pry'

def erase_overlap_intervals(intervals)
  return StandardError if intervals.empty? || intervals.nil?

  overlap_count = 0
  overlaps = {}

  intervals.each_with_index do |interval_one, idx|
    overlaps[interval_one] = []

    intervals.each do |interval_two|
      next if interval_one == interval_two

      if interval_two[0] < interval_one[1] && interval_two[1] > interval_one[0]
        overlaps[interval_one] << interval_two
      end
    end
  end


  overlap_count
end

             # [1,11],[11,22],[2,12],[1,100]
intervals = [[1,100],[11,22],[1,11],[2,12]]
output = 2
p erase_overlap_intervals(intervals) == output

intervals = [[1,2],[2,3],[3,4],[1,3]]
output = 1
p erase_overlap_intervals(intervals) == output

intervals = [[1,2],[1,2],[1,2]]
output = 2
p erase_overlap_intervals(intervals) == output
