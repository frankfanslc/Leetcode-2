require 'pry'

# Iterative DFS + sort. O(M + N log M + N)
def get_all_elements(root1, root2)
  [dfs(root1), dfs(root2)].flatten.sort
end

def dfs(root)
  return [] if root.nil?

  stack = [root]
  result = []

  while stack.any?
    current = stack.pop

    result << current.val

    stack << current.right if current.right
    stack << current.left  if current.left
  end

  result
end
