require 'pry'

def find_peak_element(nums)
  left = 0
  right = nums.length - 1

  while left < right
    mid = left + right / 2

    if nums[mid] > nums[mid+1]
      right = mid
    else
      left = mid + 1
    end
  end

  left
end

nums = [1,2,3,1]
p find_peak_element(nums) == 2

nums = [1,2,1,3,5,6,4]
p find_peak_element(nums) == 5

