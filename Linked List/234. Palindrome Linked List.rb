require 'pry'

def is_palindrome(head)
  values = []
  current = head

  while current
    values << current.val
    current = current.next
  end

  values == values.reverse
end
