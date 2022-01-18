require 'pry'

def contains_nearby_duplicate(nums, k)
  return false if nums.empty? || nums.nil?

  nums.each_with_index.inject({}) do |memo, (num, idx)|
    if memo[num].nil?
      memo[num] = [idx]
    else
      memo[num].each do |jidx|
        return true if (idx - jidx).abs <= k
      end

      memo[num] << idx
    end

    memo
  end

  false
end

p contains_nearby_duplicate([1,2,3,1], 3)
