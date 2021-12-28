require 'pry'

# def fib_bottom_up(n)
#   result = [0, 1, 1]

#   while result.length <= n
#     result << result[-1] + result[-2]
#   end

#   result[n]
# end

def climb_stairs(n)
  result = [1,2]

  while result.length <= n
    result << result[-1] + result[-2]
  end

  result[n-1]
end

p climb_stairs(2) == 2
p climb_stairs(3) == 3

# p fib_bottom_up(4)
# p fib_bottom_up(5)
# p fib_bottom_up(1000)
