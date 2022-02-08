require 'pry'

def lowest_common_ancestor(root, p, q)
  return [] if root.nil?

  recurse_tree(root, p, q)
end

def recurse_tree(node, p, q)
  return false if node.nil?

  mid = node.val == p.val ||
        node.val == q.val

  left  = recurse_tree(node.left, p, q)
  right = recurse_tree(node.right, p, q)

  if mid && (left || right)
    return node
  elsif left && right
    return node
  end

  mid || left || right
end
