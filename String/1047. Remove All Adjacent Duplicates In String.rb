require 'pry'

def remove_duplicates(s)
  return s if s.length <= 1
  return "" if s.nil?

  stack = []
  s.chars.each do |s|
    stack << s

    if stack[-2] == stack[-1]
      stack.pop
      stack.pop
    end
  end

  stack.join("")
end

p remove_duplicates("abbaca") == "ca"
