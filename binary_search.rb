require 'pry'

def lower_bound(array, x)
  # [0, 1, 2, 3, 4, 5]
  #
  # Find index of first element greater or equal to x

  length = array.length

  # Last number is less than key
  return -1 if array[length-1] < x

  # First element is greater than or equal to key
  return 0  if array[0] >= x

  lo = 0
  hi = length - 1

  while lo+1 < hi
    mid = (lo + hi) / 2
    # If midpoint is less than x
    # Then left side is false
    # Move lo to mid point to
    # continue validation of right side
    #
    # otherwise
    #
    # return mid (hi)
    if array[mid] < x
      lo = mid
    else
      hi = mid
    end
  end

  hi
end

arr = [0, 1, 2, 3, 4, 5]

p lower_bound(arr, 2) == 2
p lower_bound(arr, 3) == 3
p lower_bound(arr, 4) != 3
p lower_bound(arr, 6) == -1

