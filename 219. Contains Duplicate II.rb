require 'pry'

def contains_nearby_duplicate(nums, k)
  return false if nums.empty? || nums.nil?
  return false if k.nil?

  nums.each_with_index.inject({}) do |memo, (num, idx)|
    memo[num] ||= []
    memo[num].each do |jidx|
      return true if (idx - jidx).abs <= k
    end
    memo[num] << idx
    memo
  end

  false
end

p contains_nearby_duplicate([1,2,3,1], 3)
