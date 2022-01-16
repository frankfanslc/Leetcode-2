require 'pry'

def invert_tree(root)
  return root if root.nil?

  queue = [root]

  while queue.any?
    current = queue.pop

    queue.prepend(current.left)  if current.left
    queue.prepend(current.right) if current.right

    left_temp     = current.left
    current.left  = current.right
    current.right = left_temp
  end

  root
end
