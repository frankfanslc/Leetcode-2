require 'pry'

def two_sums(nums, target)
  hash = {}

  nums.each_with_index do |num, idx|
    complement = target - num

    if hash[complement]
      return [idx, hash[complement]].reverse
    else
      hash[num] = idx
    end
  end
end

p (two_sums([2,7,11,15], 9) == [0,1])
p (two_sums([3,2,4], 6) == [1,2])
p (two_sums([3,3], 6) == [0,1])
































































