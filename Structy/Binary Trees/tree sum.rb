require 'pry'

class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  attr_accessor :val, :left, :right
end

def tree_sum(root)
  return 0 if root.nil?

  stack = [root]
  sum = 0

  while stack.any?
    current = stack.pop
    sum += current.val

    stack << current.right if current.right
    stack << current.left  if current.left
  end

  sum
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

p tree_sum(a)

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

p tree_sum(a)
