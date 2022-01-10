require 'pry'

def majority_element(nums)
  return StandardError if nums.empty? || nums.nil?

  length = nums.length
  target = (length / 2.0).ceil

  left = 0
  right = length - 1

  counts = Hash.new(0)

  nums.sort!

  while left <= right
    counts[nums[left]] += 1
    counts[nums[right]] += 1

    if counts.values.max >= target
      return counts.key(counts.values.max)
    else
      left += 1
      right -= 1
    end
  end
end

p majority_element([3,3,4])
p majority_element([3,2,3])
