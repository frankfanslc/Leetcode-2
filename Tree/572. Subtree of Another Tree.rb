require 'pry'

def is_subtree(root, sub_root)
  return true  if root.nil? && sub_root.nil?
  return false if root.nil? || sub_root.nil?

  stack = [root]
  subtrees = []

  while stack.any?
    current = stack.pop

    if current.val == sub_root.val
      subtrees << current
    end

    stack << current.left  if current.left
    stack << current.right if current.right
  end

  return false if subtrees.empty?

  subtrees.each do |subtree|
    return true if is_same_tree(subtree, sub_root)
  end

  false
end

def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?

  dfs(p) == dfs(q)
end

def dfs(root)
  stack = [root]
  result = []

  while stack.any?
    current = stack.pop

    if current
      stack << current.right
      stack << current.left

      result << current.val
    else
      result << nil
    end
  end

  result
end
