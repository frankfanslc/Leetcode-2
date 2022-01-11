require 'pry'

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
  current = node
  next_node = current.next
  next_node_next = next_node.next

  current.val = next_node.val
  current.next = next_node_next

  next_node_next = nil
end
