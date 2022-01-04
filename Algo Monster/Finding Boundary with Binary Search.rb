require 'pry'

def find_boundary(arr)
  left = 0
  right = arr.length - 1
  result = -1

  while left <= right
    mid = (left + right) / 2

    result = mid if arr[mid]

    if arr[mid]
      right = mid - 1
    else
      left = mid + 1
    end
  end

  result
end

arr = [false, false, true, true, true]
p find_boundary(arr) == 2

arr = [false, false, false, true, true]
p find_boundary(arr) == 3

arr = [false, false, false]
p find_boundary(arr) == -1

arr = [false]
p find_boundary(arr) == -1

arr = [false]
p find_boundary(arr) == -1

arr = [true]
p find_boundary(arr) == 0

arr = []
p find_boundary(arr) == -1
