require 'pry'

def postorder_traversal(root)
  return [] if root.nil?

  stack = [root]
  result = []

  while stack.any?
    current = stack.pop

    next if current.nil?

    result << current.val

    stack << current.left
    stack << current.right
  end

  result.reverse
end


def postorder_traversal(root)
  return [] if root.nil?

  result = []

  dfs(root, result)
end

def dfs(node, result)
  return result if node.nil?

  dfs(node.left, result)
  dfs(node.right, result)

  result << node.val
end
