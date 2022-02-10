require 'pry'

def find_leaves(root)
  return [] if root.nil?

  # Find all the leaf nodes + keep track of parent + branch
  # Iterate through leaf nodes + parents, set parent branch to nil
  # Readd root to stack and repeat

  stack = [{ node: root,
             parent: nil,
             branch: nil }]
  current_leaves = []
  result =[]

  while stack.any?
    current = stack.pop

    if !current[:node].left && !current[:node].right
      current_leaves << current

      if stack.empty?
        result << current_leaves.map { |leaf| leaf[:node].val }
        remove_current_leaves!(current_leaves)
        current_leaves = []

        if root.left || root.right
          stack << { node: root,
                     parent: nil,
                     branch: nil }
        else
          result << [root.val] unless result.include? [root.val]
        end
      end
    end

    stack << { node: current[:node].left,
               parent: current[:node],
               branch: :left } if current[:node].left

    stack << { node: current[:node].right,
               parent: current[:node],
               branch: :right } if current[:node].right
  end

  result
end

def remove_current_leaves!(current_leaves)
  current_leaves.each do |leaf|
    if leaf[:branch] == :left
      leaf[:parent].left = nil
    end
    if leaf[:branch] == :right
      leaf[:parent].right = nil
    end
  end
end
