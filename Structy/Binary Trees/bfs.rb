class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  attr_accessor :val, :left, :right
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

#      a
#    /   \
#   b     c
#  / \     \
# d   e     f

def breadth_first_values(root)
  queue = [root]
  result = []

  while queue.any?
    current = queue.pop
    result << current.val

    queue.prepend(current.left)  if current.left
    queue.prepend(current.right) if current.right
  end

  result
end

p breadth_first_values(a)
