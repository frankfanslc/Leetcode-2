require 'pry'

def two_sums(nums, target)
  # 1. Create a hash
  # 2. If complement is already in hash, return indices
  # 3. If not continue

  hash = Hash.new

  nums.each_with_index do |num, idx|
    complement = hash[target - num]
    if complement
      return [complement, idx]
    else
      hash[num] = idx
    end
  end
end

p (two_sums([2,7,11,15], 9) == [0,1])
p (two_sums([3,2,4], 6) == [1,2])
p (two_sums([3,3], 6) == [0,1])
