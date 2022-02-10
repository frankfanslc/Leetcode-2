require 'pry'

def level_order_bottom(root)
  return [] if root.nil?

  queue = [root, :end_level]
  result =[[root.val]]

  while queue.any?
    current = queue.shift

    if current == :end_level
      if queue.any?
        level = queue.map do |node|
          node.val
        end

        result.prepend(level)
        queue << :end_level
      end

      next
    end

    queue << current.left if current.left
    queue << current.right if current.right
  end

  result
end
