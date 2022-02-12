require 'pry'

def sum_non_negative_integers(n)
  return n if n < 1

  n += sum_non_negative_integers(n - 1)
end

# p sum_non_negative_integers(4) == 10
# p sum_non_negative_integers(5) == 15
# p sum_non_negative_integers(0) == 0

def grid_paths(n, m)
  return 1 if n == 1 || m == 1

  grid_paths(n, m-1) + grid_paths(n-1, m)
end

p grid_paths(3,3)
p grid_paths(5,4)
p grid_paths(3,2)
p grid_paths(2,3)
p grid_paths(2,3)


