require 'pry'

def two_sum(nums, target)
  # 1. Save nums to hash map [index, key]
  # 1. Iterate through nums
  # 2. Each iteration, find difference to get target
  # 3. Check to see if difference exists in hash

  nums_hash = Hash.new
  nums.each_with_index do |k, idx|
    nums_hash[k] = idx
  end

  continue = true
  counter = 0

  while continue do
    difference = target - nums[counter]

    if nums_hash.has_key? difference
      if nums_hash[difference] != counter
        continue = false
        result = [counter, nums_hash[difference]]
      end
    end

    counter += 1
  end

  result
end

p (two_sum([2,7,11,15], 9) == [0,1])
p (two_sum([3,2,4], 6) == [1,2])
p (two_sum([3,3], 6) == [0,1])
