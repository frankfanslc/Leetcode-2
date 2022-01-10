require 'pry'

def single_number(nums)
  result = Hash.new(0)

  nums.each do |num|
    result[num] += 1

    if result[num] == 2
      result[num] = false
    end
  end

  result.select do |k,v|
    v != false
  end.keys.first
end

p single_number([1,1,2,2,3,4,5,5,6,6,4]) == 3
