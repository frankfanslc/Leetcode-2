require 'pry'

def min_depth(root)
  return 0 if root.nil?

  min = Float::INFINITY
  count = 0

  dfs(root, min, count)
end

def dfs(node, min, count)
  return min if node.nil?

  count += 1

  if !node.left && !node.right
    min = [min, count].min
  end

  left = dfs(node.left, min, count)
  right = dfs(node.right, min, count)

  [left, right, min].min
end
