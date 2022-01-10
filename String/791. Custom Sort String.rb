require 'pry'

def custom_sort_string(order, s)
  return "" if order.nil? || s.nil?

  order_hash = Hash.new
  order.chars.each_with_index do |letter, idx|
    order_hash[letter] = idx
  end

  s.chars.inject([]) do |memo, letter|
    if order_hash[letter] && order_hash[letter] >= (order_hash[memo[-1]] || 0)
      memo << letter
    else
      memo.prepend(letter)
    end

    memo
  end
end

order = "cba"
s = "abcd"
output = "cbad"
p custom_sort_string(order, s) == output
p custom_sort_string(order, s)
