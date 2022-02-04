require 'pry'

def inorder_traversal(root)
  return [] if root.nil?

  stack = []
  current = root
  result = []

  while stack.any? || current
    if current
      stack << current
      current = current.left
    else
      current = stack.pop
      result << current.val
      current = current.right
    end
  end

  result
end
