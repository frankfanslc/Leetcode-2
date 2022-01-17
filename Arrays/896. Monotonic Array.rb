require 'pry'

def is_monotonic(nums)
  increasing = true
  decreasing = true

  nums.each_with_index do |num, idx|
    break if idx == nums.length - 1
    increasing = (num <= nums[idx+1]) if (num <= nums[idx+1]) == false
    decreasing = (num >= nums[idx+1]) if (num >= nums[idx+1]) == false
  end

  increasing || decreasing
end
