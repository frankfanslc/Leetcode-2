require 'pry'

def check_subarray_sum(nums, k)
  nums.each_with_index.inject(0) do |accum, (num, idx)|
    accum += num

    sub = check_subarray_sum(nums[1..-1], k)
    return true if accum % k == 0 && idx > 0
    return true if sub

    accum
  end

  false
end

nums = [23,2,4,6,7]
k = 6
p check_subarray_sum(nums, k) == true
