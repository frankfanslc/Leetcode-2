require 'pry'

def check_subarray_sum(nums, k)
  prefix_array = [0]
  nums.each_with_index.inject(0) do |sum, (num, idx)|
    sum += num
    prefix_array << sum
    sum
  end

  (1...(prefix_array.size-1)).each do |i|
    ((i+1)...prefix_array.size).each do |j|
      return true if 0 == (prefix_array[j] - prefix_array[i-1]) % k
    end
  end

  false
end
               # 5 size
      # 0  1 2 3 4
nums = [23,2,4,6,7]
k = 6
p check_subarray_sum(nums, k) == true

