require 'pry'

# Three Scenarios
# 1. [1,2,3]
# 2. [2,3,1]
# 3. [3,2,1]

def find_min(nums)
  left = 0
  right = nums.length - 1

  # Base case
  if nums[right] > nums[left]
    return nums[left]
  end

  while left <= right
    mid = (left + right) / 2

    # [2,3,1]
    if nums[mid] > nums[mid+1]
      return nums[mid+1]
    end

    # [3,1,2]
    if nums[mid] < nums[mid-1]
      return nums[mid]
    end

    if nums[mid] > nums[left]
      right = mid
    else
      left = mid
    end
  end
end

p (find_min([3,4,5,1,2]) == 1)
p (find_min([4,5,6,7,0,1,2]) == 0)
p (find_min([11,13,15,17]) == 11)
p (find_min([2,1]) == 1)
