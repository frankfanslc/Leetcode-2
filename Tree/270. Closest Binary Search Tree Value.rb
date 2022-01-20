require 'pry'

def closest_value(root, target)
  return target if root.nil?
  return StandardError if target.nil?

  stack = [root]
  closest = [root.val, Float::INFINITY]

  while stack.any?
    current = stack.pop

    abs_val = (target - current.val).abs

    if abs_val < closest[1]
      closest = [current.val, abs_val]
    end

    if target < current.val
      stack << current.left  if current.left
    else
      stack << current.right if current.right
    end
  end

  closest[0]
end
