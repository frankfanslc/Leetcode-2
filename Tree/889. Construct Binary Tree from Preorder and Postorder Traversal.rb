require 'pry'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def construct_from_pre_post(preorder, postorder)
  return nil if preorder.empty?

  current = preorder.shift
  root = TreeNode.new(current)

  postorder.pop

  preorder_mid = preorder.index(postorder.last) || 0
  left_preorder = preorder[0...preorder_mid]
  right_preorder = preorder[preorder_mid..-1]

  postorder_mid = postorder.index(preorder.first) || 0
  left_postorder = postorder[0..postorder_mid]
  right_postorder = postorder[postorder_mid+1..-1]

  root.left = construct_from_pre_post(left_preorder, left_postorder)
  root.right = construct_from_pre_post(right_preorder, right_postorder)

  root
end

# preorder = [1,2,4,5,3,6,7]
# postorder = [4,5,2,6,7,3,1]
preorder = [2,1]
postorder = [1,2]
p construct_from_pre_post(preorder, postorder)
