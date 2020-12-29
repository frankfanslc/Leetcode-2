require 'pry'

def two_sums(nums, target)
  indices = Hash.new
  nums.each_with_index do |num, idx|
    indices[num] = idx
  end

  sorted = nums.sort

  left_index = 0
  right_index = sorted.length - 1

  while (sorted[left_index] + sorted[right_index]) != target
    if (sorted[left_index] + sorted[right_index] > target)
      right_index -= 1
    else
      left_index += 1
    end
  en

  [indices[left], indices[right]]
end

p (two_sums([2,7,11,15], 9) == [0,1])
p (two_sums([3,2,4], 6) == [1,2])
