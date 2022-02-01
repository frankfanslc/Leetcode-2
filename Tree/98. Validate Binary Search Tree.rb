require 'pry'

def is_valid_bst(root)
  stack = [{ node: root,
             lower: -Float::INFINITY,
             upper: Float::INFINITY }]
  root = true

  while stack.any?
    current = stack.pop

    node = current[:node]
    lower = current[:lower]
    upper = current[:upper]

    if root
      root = false
    else
      return false if node.val >= upper || node.val <= lower
    end

    if node.left
      stack << { node: node.left,
                 lower: lower,
                 upper: node.val }
    end

    if node.right
      stack << { node: node.right,
                 lower: node.val,
                 upper: upper }
    end
  end

  true
end
