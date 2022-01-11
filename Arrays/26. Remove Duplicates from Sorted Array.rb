require 'pry'

def remove_duplicates(nums)
  nums.each_with_index do |num, idx|
    next if idx == 0

    if num == nums[idx-1]
      nums[idx-1] = 'X'
    end
  end

  nums.delete('X')
  nums.length
end

nums = [1,1,2]
# nums = [0,0,1,1,1,2,2,3,3,4]
output = 5
# nums = [0,1,2,3,4,_,_,_,_,_]
p remove_duplicates(nums)
