require 'pry'

def climb_stairs(n)
  # current_x = 0

  # n.times do |x|
  #   current_x = climb_stairs(x - 1) + x

  #   if current_x < x
  #     current_x = x
  #   end
  # end

  # current_x
  # binding.pry
  one, two = 1, 1

  (n - 1).times do
    temp = one
    one = one + two
    two = temp
  end

  one
end

p climb_stairs(2) == 2
p climb_stairs(3) == 3
