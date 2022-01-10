require 'pry'

def missing_number(nums)
  sum = (0..nums.length).sum
  missing_sum = nums.sum

  sum - missing_sum
end
