require 'pry'

def zigzag_level_order(root)
  return [] if root.nil?

  queue = [root, :stop]
  level = []
  result = []
  reverse = false

  while queue.any?
    current = queue.shift

    if current == :stop
      if reverse
        result << level.reverse
      else
        result << level
      end

      level = []
      queue << :stop unless queue.empty?
      reverse = reverse ? false : true
      next
    end

    level << current.val

    queue << current.left if current.left
    queue << current.right if current.right
  end

  result
end
