require 'pry'

# Preorder N - L - R
# from Root, increment distance
# if target found Left...
#    right add distance
#    left subtract distance
def distance_k(root, target, k)
  distances = { :left => {},
                :right => {},
                :root => {} }

  queue = [{ node: root, distance: 0, branch: :root }]

  while queue.any?
    current = queue.shift

    if current[:node].val == target.val
      found = current
    end

    distances[current[:branch]][current[:distance]] ||= []
    distances[current[:branch]][current[:distance]] << current[:node].val

    left_branch = if current[:branch] == :root
                    :left
                  else
                    current[:branch]
                  end

    right_branch = if current[:branch] == :root
                     :right
                   else
                    current[:branch]
                   end

    queue << { node: current[:node].left,
               distance: current[:distance] + 1,
               branch: left_branch } if current[:node].left

    queue << { node: current[:node].right,
               distance: current[:distance] + 1,
               branch: right_branch } if current[:node].right
  end

  result = []

  left_distance_1 = nil
  left_distance_2 = nil
  right_distance_1 = nil
  right_distance_2 = nil

  if found[:branch] == :left
    left_distance_1 = (k + found[:distance]).abs
    left_distance_2 = (k - found[:distance]).abs
    right_distance_1 = (k - found[:distance]).abs
  elsif found[:branch] == :right
    left_distance_1 = (k - found[:distance]).abs
    right_distance_1 = (k + found[:distance]).abs
    right_distance_2 = (k - found[:distance]).abs
  end

  p distances

  result << distances[:left][left_distance_1]
  if left_distance_2 && found[:distance] > k
    result << distances[:left][left_distance_2] if left_distance_2 > 0
  end
  result << distances[:right][right_distance_1]
  if right_distance_2 && found[:distance] > k
    result << distances[:right][right_distance_2] if right_distance_2 > 0
  end
  result = result.flatten.compact
  result.delete(found[:node].val)
  result
end
