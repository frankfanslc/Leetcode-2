require 'pry'

def is_symmetric(root)
  return true if root.nil?

  queue = [root, :end_level]

  while queue.any?
    current = queue.pop

    if current == :end_level
      if queue.length % 2 > 0
        return false
      end

      return false if !symmetric(queue)

      queue << :end_level
      next
    end

    queue.prepend(current.left)
    queue.prepend(current.right)
  end

  true
end

def check_mirror(queue)
  dupe = queue.dup

  while dupe.any?
    return false if dupe.shift != dupe.pop
  end

  true
end
