require 'pry'

def is_valid(s)
  return false if s.chars.length.odd?

  stack = []

  opening_bracket = proc do |char|
    ['(', '{', '['].include? char
  end

  s.chars.each do |char|
    puts "STACK: #{stack}"
    case char
    when opening_bracket then stack << char
    when ')' then return false if (stack.pop != '(')
    when '}' then return false if (stack.pop != '{')
    when ']' then return false if (stack.pop != '[')
    end
  end

  stack.empty?
end

p is_valid("()") == true
p is_valid("()[]{}") == true
p is_valid("(]") == false
p is_valid("([}}])") == false
