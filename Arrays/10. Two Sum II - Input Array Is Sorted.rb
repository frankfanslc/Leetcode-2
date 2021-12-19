require 'pry'

def two_sum(numbers, target)
  hash = {}

  numbers.each_with_index do |num, idx|
    complement = target - num

    if hash[complement]
      return [idx+1, hash[complement]+1].reverse
    else
      hash[num] = idx
    end
  end
end

p two_sum([2,7,11,15], 9) == [1,2]
p two_sum([2,3,4], 6) == [1,3]
p two_sum([-1,0], -1) == [1,2]
