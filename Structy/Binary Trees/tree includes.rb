require 'pry'

class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  attr_accessor :val, :left, :right
end

a = Node.new("a")
b = Node.new("b")
c = Node.new("c")
d = Node.new("d")
e = Node.new("e")
f = Node.new("f")

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

def tree_includes(root, target)
  return false if root.nil?
  return true if root.val == target

  tree_includes(root.right, target) || tree_includes(root.left, target)
end

def tree_includes(root, target)
  return false if root.nil?

  queue = [root]

  while queue.any?
    current = queue.pop

    return true if current.val == target

    queue.prepend(current.right) if current.right
    queue.prepend(current.left)  if current.left
  end

  false
end

p tree_includes(a, "e") == true
p tree_includes(a, "a") == true
p tree_includes(a, "n") == false
p tree_includes(a, "p") == false
p tree_includes(nil, "b") == false
