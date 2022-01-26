require 'pry'
require 'set'

def find_pairs(nums, k)
  return 0 if nums.nil? || nums.empty?
  return StandardError if k.nil?

  complements = {}
  result = Set.new

  nums.each do |num|
    complements[num] ||= [0, 0]
    complements[num] = [(num + k), complements[num][1] += 1]
  end

  complements.each do |key, (diff, freq)|
    next if !nums.include?(diff)
    next if key == diff && freq < 2

    result << [key, diff]
  end

  result.count
end

nums = [3,1,4,1,5]
p find_pairs(nums, 2) == 2
p find_pairs(nums, 2)

nums = [1,2,3,4,5]
p find_pairs(nums, 1) == 4
p find_pairs(nums, 1)

nums = [1,3,1,5,4]
p find_pairs(nums, 0) == 1
p find_pairs(nums, 0)

