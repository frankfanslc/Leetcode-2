require 'pry'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

p = TreeNode.new(1)
q = TreeNode.new(1)
one = TreeNode.new(2)
two = TreeNode.new(3)

p.left = one
p.right = two

q.left = one
q.right = two

def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?

  dfs(p) == dfs(q)
end

def dfs(root)
  stack = [root]
  result = []

  while stack.any?
    current = stack.pop

    if current
      stack << current.right
      stack << current.left

      result << current.val
    else
      result << nil
    end
  end

  result
end

p is_same_tree(p, q)
