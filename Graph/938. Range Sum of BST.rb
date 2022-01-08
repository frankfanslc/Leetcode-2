require 'pry'

def range_sum_bst(root, low, high)
  return StandardError if root.nil? || low.nil? || high.nil?

  range = (low..high).to_a
  within_range = []

  stack = [root]

  binding.pry
  while !stack.empty?
    current = stack.pop

    if range.include? current.val
      within_range << current.val
    end

    stack << current.left  if current.left && current.val > low
    stack << current.right if current.right && current.val < high
  end

  within_range.sum
end
