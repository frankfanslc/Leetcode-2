require 'pry'

def next_permutation(nums)
  index = nums.count - 1
  while index - 1 >= 0 && nums[index] <= nums[index - 1]
    index -= 1
  end

  if index == 0
    nums.reverse!
    return nums
  end

  greater = index

  while greater + 1 < nums.count && nums[greater + 1] > nums[index - 1]
    greater += 1
  end

  nums[greater], nums[index - 1] = nums[index - 1], nums[greater]
  nums[index..-1] = nums[index..-1].reverse

  nums
end

p next_permutation([2,3,1]) == [3,1,2]
p next_permutation([1,3,2]) == [2,1,3]
p next_permutation([1,2]) == [2,1]
p next_permutation([1,2,3]) == [1,3,2]
p next_permutation([3,2,1]) == [1,2,3]
