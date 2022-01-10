require 'pry'

class Solution
  def initialize(w)
    @weights = w.inject([]) do |memo, weight|
      memo << (memo[-1] || 0) + weight
      memo
    end
    @total_sum = @weights[-1]
  end

  def pick_index()
    rand_num = rand(1..@total_sum)

    left = 0
    right = @weights.length - 1

    while left < right
      mid = (left + right) / 2

      if rand_num > @weights[mid]
        left = mid + 1
      else
        right = mid
      end
    end

    left
  end
end

s = Solution.new([950,804,830,40,591,706,895,90,702,812,678,673,344,242,792,710,919,254,185,658,612,480,880,81,661,755,556,117,592,409,51,538,889,186,810,836,626,425,324])
p s.pick_index
