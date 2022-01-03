require 'pry'

# (),{},[]
def valid_parentheses(s)
  return false if s.length.odd?

  chars = s.chars
  stack = [chars[0]]

  chars[1..-1].each do |char|
    stack.push(char)

    return false if invalid_pair?(stack[-2], stack[-1])

    if pair?(stack[-2], stack[-1])
      stack.pop
      stack.pop
    end
  end

  stack.empty?
end

def pair?(one, two)
  return if two.nil?

  key = {
    "{" => "}",
    "(" => ")",
    "[" => "]"
  }

  key[one] == two
end

def invalid_pair?(one, two)
  return if one.nil?
  return if two.nil?

  key = {
    "{" => [")", "]"],
    "(" => ["}", "]"],
    "[" => [")", "}"]
  }

  return true if key[one].nil?
  key[one].include?(two)
end

# p valid_parentheses("()") == true
# p valid_parentheses("(}") == false
p valid_parentheses("()[]{}") == true
# p valid_parentheses("(]") == false
# p valid_parentheses("([)]") == false
# p valid_parentheses("){") == false
# p valid_parentheses("([][]{}){}{") == false
