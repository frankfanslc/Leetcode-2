require 'pry'

def three_sum(nums)
  # Can I sort the array?
  # 1. Brute force O(N^3)
  # 2. Faster O(N) using Hash Map
  #

  return [] if nums.nil?
  return [] if nums.empty?
  return [] if nums == [0]
  return [] if nums.length < 3
  return [[0,0,0]] if (nums.uniq.size == 1 && nums.first == 0)

  left = 0
  right = 1
  result = []

  while right < nums.length do
    possible_nums = Hash.new
    nums_clone = nums.clone
    nums_clone.delete(nums[left])
    nums_clone.delete(nums[right])
    nums_clone.each do |num|
      possible_nums[num] = num
    end

    needed_solution = -(nums[left] + nums[right])

    if possible_nums[needed_solution]
      result << [nums[left], nums[right], needed_solution]
    end

    left += 1
    right += 1
  end

  result
end

p three_sum([3,-2,1,0]) == []
p three_sum([-1,0,1,2,-1,-4]) == [[-1,-1,2],[-1,0,1]]
p three_sum([]) == []
p three_sum([0]) == []
