require 'pry'

def min_steps(s, t)
  return StandardError if s.nil? || t.nil?

  t_stack = t.chars.sort
  s_stack = s.chars.sort
  count = 0

  while t_stack.any?
    binding.pry
    if t_stack.pop != s_stack.pop
      count += 1
    end
  end

  count
end

# s = "bab"
# t = "aba"
# p min_steps(s, t) == 1

s = "leetcode"
t = "practice"
p min_steps(s, t)
