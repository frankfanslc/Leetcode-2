require 'pry'

def search(nums, target)
  # [4,5,6,7,0,1,2]
  #  0,1,2,3,4,5,6
  #  1,2,3,4,5,6,7
  left = 0
  right = nums.length - 1
  result = -1

  # possible exit scenarios
  #
  # [1,2,3]
  #
  # [2,3,1]
  #
  # [3,1,2]
  while left <= right do
    mid = (left + right) / 2

    # p "LEFT #{left}"
    # p "MID #{mid}"
    # p "RIGHT #{right}"
    # p "-------------"

    if nums[mid] == target
      result = mid
      break
    end

    if nums[left] == target
      result = left
      break
    end

    if nums[right] == target
      result = right
      break
    end

    if (nums[mid] >= nums[left])
      # Target is potentially in left side
      if target >= nums[left] && target < nums[mid]
        # Target is in left side
        right = mid - 1
      else
        left = mid + 1
      end
    else
      # Target is potentiall in right side
      if target > nums[mid] && target <= nums[right]
        # Target is in right side
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end

  result
end

p (search([5,1,2,3,4], 1) == 1)
p (search([4,5,6,7,0,1,2], 0) == 4)
p (search([4,5,6,7,0,1,2], 3) == -1)
p (search([4,5,6,7,0,1,2], 5) == 1)
p (search([1], 0) == -1)
p (search([1], 1) == 0)
