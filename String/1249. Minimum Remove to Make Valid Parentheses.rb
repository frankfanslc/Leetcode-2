require 'pry'

def min_remove_to_make_valid(s)
  return "" if s.nil?

  chars = s.chars
  parens = ['(',')']
  stack = []

  chars.each_with_index do |char, idx|
    next if !parens.include? char

    stack << [char, idx]

    if stack.length >= 2
      if stack[-2][0] == '(' && stack[-1][0] == ')'
        stack.pop
        stack.pop
      end
    end
  end

  stack.each do |char|
    chars[char[1]] = '*'
  end

  chars.join('').gsub('*', '')
end

s = "lee(t(c)o)de)"
output = "lee(t(c)o)de"
p min_remove_to_make_valid(s) == output

s = "))(("
output = ""
p min_remove_to_make_valid(s) == output
