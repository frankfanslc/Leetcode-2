require 'pry'

def binary_search(nums, target)
  left = 0
  right = nums.length - 1
  result = -1

  while left <= right
    mid = (right + left) / 2

    if nums[mid] == target
      result = mid
      break
    end

    if target < nums[mid]
      right = mid - 1
    else
      left = mid + 1
    end
  end

  result
end

nums = [-1,0,3,5,9,12]
target = 9
output = 4
p binary_search(nums, target) == output


nums = [-1,0,3,5,9,12]
target = 2
output = -1
p binary_search(nums, target) == output
