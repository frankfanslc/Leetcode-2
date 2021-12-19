require 'pry'

def max_sub_array(nums)
  curr_sub_array = nums[0]
  max_sub_array  = nums[0]

  for num in nums[1..nums.length-1] do
    puts "CURR SUB ARRAY #{curr_sub_array}"
    puts "MAX SUB ARRAY #{max_sub_array}"
    puts "------------------"
    curr_sub_array = [num, curr_sub_array + num].max
    max_sub_array = [curr_sub_array, max_sub_array].max
  end

  max_sub_array
end

p max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) == 6
# p max_sub_array([1]) == 1
# p max_sub_array([5,4,-1,7,8]) == 23

