require 'pry'

def max_product(nums)
  if nums.length == 0
    return 0
  end

  min_so_far = nums[0]
  max_so_far = nums[0]
  result = max_so_far

  for num in nums[1..nums.length] do
    puts "MIN #{min_so_far}"
    puts "MAX #{max_so_far}"
    puts "RES #{result}"
    puts "---------------------"
    temp_max   = [num, max_so_far * num, min_so_far * num].max
    min_so_far = [num, max_so_far * num, min_so_far * num].min

    max_so_far = temp_max

    result = [max_so_far, result].max
  end

  result
end

p max_product([2,3,-2,4]) == 6
p max_product([-2,0,-1]) == 0
p max_product([-2,3,-4]) == 24
p max_product([2,-5,-2,-4,3]) == 24

