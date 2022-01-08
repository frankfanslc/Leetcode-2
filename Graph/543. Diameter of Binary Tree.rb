require 'pry'

def diameter_of_binary_tree(root)
  return 0 if root.nil?

  nodes = []
  stack = [root]

  while stack.any?
    current = stack.pop
    nodes << current

    stack << current.left if current.left
    stack << current.right if current.right
  end

  nodes.uniq!

  diameters = []
  nodes.each do |node|
    diameter = [0,0]
    node_stack = [node]

    while node_stack.any?
      current = node_stack.pop

      if current.left
        node_stack << current.left
        diameter[0] += 1
      end

      if current.right
        node_stack << current.right
        diameter[1] += 1
      end

      node_stack << current.left if current.left
      node_stack << current.right if current.right
    end

    diameters << diameter.sum
  end

  diameters.max
end
