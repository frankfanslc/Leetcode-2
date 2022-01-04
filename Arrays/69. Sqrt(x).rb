require 'pry'

def my_sqrt(x)
  return x if x < 2

  left = 2
  right = x / 2

  while left <= right
    mid = (left + right) / 2
    square = mid * mid

    if square > x
      right = mid - 1
    elsif square < x
      left = mid + 1
    else
      return mid
    end
  end

  right
end

p my_sqrt(4) == 2
p my_sqrt(8) == 2
p my_sqrt(1) == 1
p my_sqrt(0) == 0
