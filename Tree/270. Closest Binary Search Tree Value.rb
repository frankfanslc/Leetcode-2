require 'pry'

def closest_value(root, target)
  return target if root.nil?
  return StandardError if target.nil?

  stack = [root]
  closest = [nil, nil]

  while stack.any?
    current = stack.pop

    abs_val = (target - current.val).abs

    if closest[1].nil?
      closest = [current.val, abs_val]
    elsif abs_val < closest[1]
      closest = [current.val, abs_val]
    end

    stack << current.right if current.right
    stack << current.left  if current.left
  end

  closest[0]
end
