require 'pry'
require 'set'

def three_sum(nums)
  return [] if nums.empty?
  return [] if nums.length <= 2

  # 1. Take first two elements
  # 2. Add them and find the third complement
  # 3. See if complement exists, if yes, add to result
  # 4. Take next two elements
  # 5. Repeat till end

  left = 0
  right = left + 1
  last = nums.length - 1
  result = []
  hash = {}
  nums.each_with_index do |num, idx|
    if hash[num]
      hash[num] << idx
    else
      hash[num] = [idx]
    end
  end

  while right <= last
    complement = -(nums[left] + nums[right])

    if hash[complement]
      repeats = hash[complement].length

      if repeats >= 3
        result << [nums[left], nums[right], complement].sort!
      elsif repeats == 2 && !hash[complement].include?(left) && !hash[complement].include?(right)
        result << [nums[left], nums[right], complement].sort!
      elsif !hash[complement].include?(left) && !hash[complement].include?(right)
        result << [nums[left], nums[right], complement].sort!
      end

      result.uniq!
    end

    left += 1
    right += 1
  end

  binding.pry
  result.reverse
end

p three_sum([-1,0,1,2,-1,-4]) == [[-1,-1,2], [-1,0,1]]
# p three_sum([0,0,0]) == [[0,0,0]]
# p three_sum([-1,0,1]) == [[-1,0,1]]
# p three_sum([3,-2,1,0]) == []
# p three_sum([]) == []
# p three_sum([0]) == []
