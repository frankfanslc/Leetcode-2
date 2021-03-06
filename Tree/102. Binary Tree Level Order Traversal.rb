require 'pry'

def level_order(root)
  return [] if root.nil?

  queue = [root, :stop]
  level = []
  result = []

  while queue.any?
    current = queue.shift

    if current == :stop
      result << level
      level = []
      queue << :stop unless queue.empty?
      next
    end

    level << current.val

    queue << current.left if current.left
    queue << current.right if current.right
  end

  result
end
