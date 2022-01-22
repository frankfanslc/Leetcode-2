require 'pry'

# Brute force - O(n)
def top_k_frequent(nums, k)
  return [] if nums.empty? || nums.nil?
  return StandardError if k.nil?

  freq = {}

  nums.each do |num|
    freq[num] ||= 0
    freq[num] += 1
  end

  freq.sort_by do |k,v|
    v
  end.map do |pair|
    pair[0]
  end[-k..-1]
end

# Two pointer approach - O(n log n)
def top_k_frequent(nums, k)
  return [] if nums.empty? || nums.nil?
  return StandardError if k.nil?

  left = 0
  right = nums.length - 1
  freq = {}

  while left <= right
    freq[nums[left]]  ||= 0
    freq[nums[right]] ||= 0
    freq[nums[left]]   += 1
    freq[nums[right]]  += 1

    left += 1
    right -= 1
  end

  freq.sort_by do |k,v|
    v
  end.map do |pair|
    pair[0]
  end[-k..-1]
end

nums = [1,1,1,2,2,3]
p top_k_frequent(nums, 2) == [1,2]
