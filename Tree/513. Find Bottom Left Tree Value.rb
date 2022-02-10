require 'pry'

def find_bottom_left_value(root)
  return nil if root.nil?

  queue = [root, :end_level]
  result = root.val

  while queue.any?
    current = queue.shift

    if current == :end_level
      if queue.any?
        result = queue.first.val
        queue << :end_level
      end

      next
    end

    queue << current.left  if current.left
    queue << current.right if current.right
  end

  result
end
