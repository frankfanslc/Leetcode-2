require 'pry'

# Find the parents of each p and q
# Answer is the lowest parent

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

def lowest_common_ancestor(root, p, q)
  return StandardError if root.nil? || p.nil? || q.nil?

  queue = [root]

  p_parents = [root] # [3, 5]
  q_parents = [root] # [3, 5, 1, 6, 2, 7, 4]
  p_parents_found = false
  q_parents_found = false

  while queue.any?
    current = queue.pop

    queue.prepend(current.right) if current.right
    queue.prepend(current.left)  if current.left

    p_parents_found = true if current.val == p.val
    q_parents_found = true if current.val == q.val

    if !p_parents_found
      p_parents << current.right if current.right
      p_parents << current.left  if current.left
    end

    if !q_parents_found
      q_parents << current.right if current.right
      q_parents << current.left  if current.left
    end
  end

  longest = [p_parents.length, q_parents.length].max
  result = [nil, longest]
  p p_parents.map(&:val)
  p q_parents.map(&:val)
  p_parents.each_with_index do |node, idx|
    if q_parents.map(&:val).include?(node.val) && idx < result[1]
      result = [node, idx]
    end
  end
  result[0]
end

p lowest_common_ancestor(p, 2, 3)
