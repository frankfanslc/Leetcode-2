require 'pry'

# Iterative
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

# Recursive
def inorder_traversal(root)
  return [] if root.nil?

  result = []

  dfs(root, result)
end

def dfs(root, result)
  return result if root.nil?

  dfs(root.left, result)
  result << root.val
  dfs(root.right, result)
end
