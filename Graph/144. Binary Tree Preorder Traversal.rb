require 'pry'

def preorder_traversal(root)
  return [] if root.nil?

  stack = [root]
  result = []

  while stack.any?
    current = stack.pop

    result << current.val

    stack << current.right if current.right
    stack << current.left if current.left
  end

  result
end
