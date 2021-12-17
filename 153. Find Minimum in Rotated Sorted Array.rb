require 'pry'

# THREE SCENARIOS
#
# [1,2,3] -> base sorted
# [2,3,1] -> exit 1
# [3,1,2] -> exit 2
#
def find_min(nums)
  left = 0
  right = nums.length - 1

  return nums[0] if nums.length == 1

  # [1,2,3]
  if nums[right] > nums[left] # base sort exit
    return nums[left]
  end

  while right >= left do
    mid = left + (right-left) / 2

    # [2,3,1]
    # exit condition 1
    if nums[mid] > nums[mid+1]
      return nums[mid+1]
    end

    # [3,1,2]
    # exit condition 2
    if nums[mid] < nums[mid-1]
      return nums[mid]
    end

    # [3,4,5,1,2]
    #     [5,1,2]
    if nums[mid] > nums[left] # min is in right
      left = mid
    else # min is in left
      right = mid
    end
  end
end

p (find_min([3,4,5,1,2]) == 1)
p (find_min([4,5,6,7,0,1,2]) == 0)
p (find_min([11,13,15,17]) == 11)
p (find_min([2,1]) == 1)
