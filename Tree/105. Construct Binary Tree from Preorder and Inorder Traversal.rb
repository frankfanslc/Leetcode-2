require 'pry'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def build_tree(preorder, inorder)
  return nil if preorder.empty? || inorder.empty?

  current_root = preorder.shift
  root = TreeNode.new(current_root)
  mid = inorder.index(current_root)

  return nil if mid.nil? # preorder is empty so we have found a leaf node

  left = inorder[0..mid]
  left.pop # remove mid from left inorder
  right = inorder[mid+1..-1]

  llength = left.length
  rlength = right.length

  root.left = build_tree(preorder.first(llength), left)
  root.right = build_tree(preorder.last(rlength), right)

  root
end

# preorder = [3,9,20,15,7]
# inorder = [9,3,15,20,7]
# p build_tree(preorder, inorder)

preorder = [1,2]
inorder = [1,2]
p build_tree(preorder, inorder)
