require 'pry'

# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {TreeNode} root
# @return {Integer}
#
# Recursive
def max_depth(root)
  return 0 if root == nil

  left  = max_depth(root.left) + 1
  right = max_depth(root.right) + 1

  [left, right].max
end

root = [3,9,20,nil,nil,15,7]
output = 3
p max_depth(root) == output

root = [1,nil,2]
output = 2
p max_depth(root) == output
