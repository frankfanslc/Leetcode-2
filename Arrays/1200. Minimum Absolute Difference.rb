require 'pry'
require 'set'

def minimum_abs_difference(arr)
  return [] if arr.empty? || arr.nil?

  diffs = {}
  min_diff = Float::INFINITY

  arr.each_with_index do |inum, idx|
    arr.each_with_index do |jnum, jdx|
      next if jdx == idx

      diff = (jnum - inum).abs
      diffs[diff] ||= Set.new
      diffs[diff] << [jnum, inum].sort

      min_diff = [min_diff, diff].min
    end
  end

  diffs[min_diff].sort_by do |pair|
    pair[0]
  end
end

def minimum_abs_difference(arr)
  return [] if arr.empty? || arr.nil?

  left = 0
  right = 1
  length = arr.length - 1
  diffs = {}
  min_diff = Float::INFINITY

  while left < length
    diff = (arr[left] - arr[right]).abs
    diffs[diff] ||= Set.new
    diffs[diff] << [arr[left], arr[right]].sort
    min_diff = [min_diff, diff].min

    if right == length
      left += 1
      right = left + 1
    else
      right += 1
    end
  end

  binding.pry

  diffs[min_diff].sort_by do |pair|
    pair[0]
  end
end

p minimum_abs_difference([4,2,1,3])
