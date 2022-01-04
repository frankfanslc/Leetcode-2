require 'pry'

def search_insert(nums, target)
  left = 0
  right = nums.length - 1
  result = 0

  while left <= right
    mid = (left + right) / 2

    if nums[mid] == target
      result = mid
      break
    end

    if nums[mid] > target
      result = mid
      right = mid - 1
    else
      result = mid + 1
      left = mid + 1
    end
  end

  result
end

nums = [1, 3, 5, 6]
target = 5
p search_insert(nums, target) == 2

nums = [1, 3, 5, 6]
target = 2
p search_insert(nums, target) == 1

nums = [1, 3, 5, 6]
target = 7
p search_insert(nums, target) == 4
