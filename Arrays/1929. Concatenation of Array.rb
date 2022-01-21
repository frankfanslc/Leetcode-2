require 'pry'

def get_concatenation(nums)
  return [] if nums.empty? || nums.nil?

  nums + nums
end

p get_concatenation([1,2,1]) == [1,2,1,1,2,1]
