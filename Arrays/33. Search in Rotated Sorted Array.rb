require 'pry'

def search(nums, target)
  left = 0
  right = nums.length - 1
  result = -1

  while left <= right
    mid = (left + right) / 2

    if nums[mid] == target
      result = mid
      break
    end

    if nums[mid] >= nums[left] # Left side sorted
      if target >= nums[left] && target < nums[mid]
        right = mid - 1
      else
        left = mid + 1
      end
    else
      if target <= nums[right] && target > nums[mid]
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end

  result
end

nums = [4,5,6,7,0,1,2]
target = 0
p search(nums, target) == 4

nums = [4,5,6,7,0,1,2]
target = 3
p search(nums, target) == -1

nums = [1]
target = 0
p search(nums, target) == -1

