require 'pry'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def average_of_levels(root)
  return [0] if root.nil?

  queue_one = [root]
  queue_two = []
  current_sum = 0
  current_nodes_count = 0
  result = []

  while queue_one.any? || queue_two.any?
    if queue_one.any?
      current = queue_one.pop
      current_sum += current.val
      current_nodes_count += 1

      if queue_one.empty?
        result << (current_sum.to_f / current_nodes_count.to_f)
        current_nodes_count = 0
        current_sum = 0
      end

      queue_two.prepend(current.right) if current.right
      queue_two.prepend(current.left)  if current.left
    else
      while queue_two.any?
        current = queue_two.pop
        current_sum += current.val
        current_nodes_count += 1

        if queue_two.empty?
          result << (current_sum.to_f / current_nodes_count.to_f)
          current_nodes_count = 0
          current_sum = 0
        end

        queue_one.prepend(current.right) if current.right
        queue_one.prepend(current.left)  if current.left
      end
    end
  end

  result
end

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

p average_of_levels(root)
