require 'pry'

def max_value(nums)
  head = 0
  tail = nums.length - 1
  max = nums[head]

  while head < tail
    max = nums[head] if nums[head] > max
    max = nums[tail] if nums[tail] > max
    head +=1
    tail -=1
  end

  max
end

nums = [4, 7, 2, 8, 10, 9]
p max_value(nums) == 10

nums = [10, 5, 40, 40.3]
p max_value(nums) == 40.3

nums = [-5, -2, -1, -11]
p max_value(nums) == -1

nums = [42]
p max_value(nums) == 42

nums = [1000, 8]
p max_value(nums) == 1000

nums = [1000, 8, 9000]
p max_value(nums) == 9000

nums = [2, 5, 1, 1, 4]
p max_value(nums) == 5
