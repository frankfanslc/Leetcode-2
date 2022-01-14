require 'pry'

def min_start_value(nums)
  lowest = 0

  nums.inject(0) do |memo, num|
    memo = memo + num

    if memo < lowest
      lowest = memo
    end

    memo
  end

  if lowest > 1
    1
  else
    1 - lowest
  end
end

p min_start_value([-3,2,-3,4,2])
