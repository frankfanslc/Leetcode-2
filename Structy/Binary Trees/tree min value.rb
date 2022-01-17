require 'pry'

class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  attr_accessor :val, :left, :right
end

def tree_min_value(root)
  return Float::INFINITY if root.nil?

  [root.val, tree_min_value(root.left), tree_min_value(root.right)].min
end

def tree_min_value(root)
  queue = [root]
  min_val = Float::INFINITY

  while queue.any?
    current = queue.pop

    min_val = current.val if current.val < min_val

    queue.prepend(current.right) if current.right
    queue.prepend(current.left)  if current.left
  end

  min_val
end

a = Node.new(3)
b = Node.new(11)
c = Node.new(4)
d = Node.new(4)
e = Node.new(-2)
f = Node.new(1)

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

p tree_min_value(a)

a = Node.new(1)
b = Node.new(6)
c = Node.new(0)
d = Node.new(3)
e = Node.new(-6)
f = Node.new(2)
g = Node.new(2)
h = Node.new(2)

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f
e.left = g
f.right = h

p tree_min_value(a)

a = Node.new(-2)
b = Node.new(-11)
c = Node.new(-4)
d = Node.new(4)
e = Node.new(-12)
f = Node.new(-11)

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

p tree_min_value(a)

a = Node.new(42)

p tree_min_value(a)
