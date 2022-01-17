require 'pry'

def max_depth(s)
  current = 0
  max = 0

  s.chars.each do |char|
    next unless char == "(" || char == ")"

    current += 1 if char == "("
    current -= 1 if char == ")"
    max = [current, max].max
  end

  max
end

p max_depth("(1+(2*3)+((8)/4))+1")
