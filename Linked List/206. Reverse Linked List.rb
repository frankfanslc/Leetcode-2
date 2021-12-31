require 'pry'

# class ListNode
#   attr_accessor :val, :next
#
#   def initialize(val = 0, _next = nil)
#     @val = val
#     @next = _next
#   end
# end
#
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  current = head
  prev_node = nil

  while current
    next_node = current.next
    current.next = prev_node
    prev_node = current

    current = next_node
  end

  prev_node
end

p reverse_list([1,2,3,4,5]) == [5,4,3,2,1]
# p reverse_list([1,2]) == [2,1]
