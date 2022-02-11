require 'pry'

def good_nodes(root)
  @count = 0

  preorder_dfs(root, root.val)
end

def preorder_dfs(node, max_seen)
  return @count if node.nil?

  @count += 1 if node.val >= max_seen

  preorder_dfs(node.left, [node.val, max_seen].max)
  preorder_dfs(node.right, [node.val, max_seen].max)
end
