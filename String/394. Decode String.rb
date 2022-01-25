require 'pry'

def decode_string(s)
  return "" if s.nil? || s.empty?

  chars = s.chars
  stack = []
  result = []

  while chars.any? || stack.any?
    shifted = chars.shift
    stack << shifted

    if stack[-1] == "]"
      substring = ""
      integer = ""

      stack.pop # pop closing bracket
      continue = true

      while continue
        if !integer.empty? && !integer?(stack[-1])
          continue = false
          next
        end

        popped = stack.pop

        next if popped == "["

        if integer? popped
          integer.prepend(popped)
          next
        end

        substring.prepend(popped)
      end

      if stack.include? "["
        stack << (substring * integer.to_i)
      else
        result << stack << (substring * integer.to_i)
        stack = []
      end
    end

    if chars.empty? && !stack.include?("[")
      result << stack
      result.flatten

      stack = []
    end
  end

  result.join("")
end

def integer?(char)
  char.to_i.to_s == char
end


s = "3[a]2[bc]"
p decode_string(s) == "aaabcbc"

s = "3[a2[c]]"
p decode_string(s) == "accaccacc"

s = "2[abc]3[cd]ef"
p decode_string(s) == "abcabccdcdcdef"

s = "abc3[cd]xyz"
p decode_string(s) == "abccdcdcdxyz"

s = "100[leetcode]"
p decode_string(s) == ("leetcode" * 100)
