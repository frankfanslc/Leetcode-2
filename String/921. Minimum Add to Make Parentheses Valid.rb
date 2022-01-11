require 'pry'

def min_add_to_make_valid(s)
  return StandardError if s.nil?

  stack = []

  s.chars.each do |char|
    stack << char

    if stack[-2] == '(' && stack[-1] == ')'
      stack.pop
      stack.pop
    end
  end

  stack.length
end

s = "())"
p min_add_to_make_valid(s) == 1

s = "((("
p min_add_to_make_valid(s) == 3
