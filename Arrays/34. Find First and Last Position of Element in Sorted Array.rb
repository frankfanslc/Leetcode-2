require 'pry'

def search_range(nums, target)
  range_start = bin_search(nums, target, true)
  range_end   = bin_search(nums, target, false)

  [range_start, range_end]
end

def bin_search(nums, target, left_bias)
  left = 0
  right = nums.length - 1
  result = -1

  while left <= right
    mid = (left + right) / 2

    if nums[mid] < target
      left = mid + 1
    elsif nums[mid] > target
      right = mid - 1
    else
      result = mid

      if left_bias
        right = mid - 1
      else
        left = mid + 1
      end
    end
  end

  result
end

nums = [5,7,7,8,8,10]
target = 8
p search_range(nums, target) == [3,4]

nums = [5,7,7,8,8,10]
target = 6
p search_range(nums, target) == [-1,-1]

nums = []
target = 0
p search_range(nums, target) == [-1,-1]

nums = [0,0,1,2,2]
target = 0
p search_range(nums, target) == [0,1]























