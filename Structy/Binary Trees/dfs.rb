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

def depth_first_values(root)
  stack = [root]
  result = []

  while stack.any?
    current = stack.pop

    # Push right first so that left is processed first
    stack << current.right if current.right
    stack << current.left  if current.left

    result << current.val
  end

  result
end

def depth_first_values(root)
  return [] if root.nil?

  left  = depth_first_values(root.left)
  right = depth_first_values(root.right)

  [root.val] + left + right
end

p depth_first_values(a)
