require 'pry'

def move_zeroes(nums)
  return [] if nums.nil? || nums.empty?

  left = 0
  right = nums.length - 1

  while left <= right
    if nums[left] == 0
      nums.delete_at(left)
      nums << 0

      right -= 1
    else
      left += 1
    end
  end
end

p move_zeroes([0,1,0,3,12]) == [1,3,12,0,0]
