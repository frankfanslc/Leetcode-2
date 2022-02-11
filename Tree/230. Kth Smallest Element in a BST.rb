require 'pry'

def kth_smallest(root, k)
  return nil if root.nil?

  inorder_dfs(root)[k-1]
end

def inorder_dfs(node, result = [])
  return result if node.nil?

  inorder_dfs(node.left, result)
  result << node.val
  inorder_dfs(node.right, result)
end
