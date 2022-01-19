require 'pry'

def max_level_sum(root)
  return [0] if root.nil?

  queue_one = [root]
  queue_two = []
  result = []
  current_sum = 0

  while queue_one.any? || queue_two.any?
    if queue_one.any?
      current = queue_one.pop
      current_sum += current.val

      if queue_one.empty?
        result << current_sum
        current_sum = 0
      end

      queue_two.prepend(current.right) if current.right
      queue_two.prepend(current.left)  if current.left
    else
      while queue_two.any?
        current = queue_two.pop
        current_sum += current.val

        if queue_two.empty?
          result << current_sum
          current_sum = 0
        end

        queue_one.prepend(current.right) if current.right
        queue_one.prepend(current.left)  if current.left
      end
    end
  end

  result.index(result.max) + 1
end
