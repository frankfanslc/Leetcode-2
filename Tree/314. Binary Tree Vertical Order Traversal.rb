require 'pry'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def vertical_order(root)
  return StandardError if root.nil?

  left_stack  = [root]
  lr_idx = 0
  right_stack = []
  result = []

  while left_stack.any? || right_stack.any?
    if left_stack.any?
      lr_idx -= 1
      current = left_stack.pop
      result << [current, lr_idx]
    else
      lr_idx += 1
      current = right_stack.pop
      result << [current, lr_idx]
    end

    left_stack << current.left  if current.left
    right_stack << current.right if current.right
  end

  binding.pry
  result
end
         # L  P
# result = 9, 3

# [3]
# 3 20 9

# [9, 3]
# 3 20 <- 7, 15

 # L  P  R   L      L  P  L   R
# [9, 3, 20, 15] -> 9, 3, 15, 20
# 3 7

# L  P   L   RP   R
# [9, 3, 15, 20, 7]

root = TreeNode.new(3)
a = TreeNode.new(9)
b = TreeNode.new(20)
c = TreeNode.new(15)
d = TreeNode.new(7)
# a = TreeNode.new(9)
# a = TreeNode.new(9)
root.left = a
root.right = b
b.left = c
b.right = d

root = root
p vertical_order(root) == [[9], [3,15], [20], [7]]
