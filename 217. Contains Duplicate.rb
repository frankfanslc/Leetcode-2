require 'pry'

def contains_duplicate(nums)
  hash = {}
  has_duplicate = false

  nums.each do |num|
    if hash[num]
      has_duplicate = true
      break
    else
      hash[num] = num
    end
  end

  has_duplicate
end

p contains_duplicate([1,2,3,1]) == true
p contains_duplicate([1,2,3,4]) == false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2]) == true
