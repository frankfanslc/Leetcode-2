require 'pry'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left = 0
  right = nums.length - 1

  while left <= right
    mid = (right + left) / 2

    if nums[mid] == target
      return mid
    elsif nums[left] == target
      return left
    elsif nums[right] == target
      return right
    elsif nums[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  -1
end

# Input: nums = [-1,0,3,5,9,12], target = 9
# Output: 4

p search([-1,0,3,5,9,12], 9) == 4
# p search([-1,0,3,5,9,12], 2) == -1

