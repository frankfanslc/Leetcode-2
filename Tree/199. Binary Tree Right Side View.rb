require 'pry'

def right_side_view(root)
  return [] if root.nil?

  queue = [[root, true]]
  result = []

  while queue.any?
    current = queue.pop
    current_node = current[0]
    right_side_visible = current[1]

    if right_side_visible
      result << current_node.val
    end

    if current_node.right || has_right_node_to_come?(queue)
      queue.prepend([current_node.left, false]) if current_node.left
    else
      queue.prepend([current_node.left, true])  if current_node.left
    end

    queue.prepend([current_node.right, true]) if current_node.right

  end

  result
end

def has_right_node_to_come?(queue)
  queue.find do |val|
    val[0] == true
  end
end
