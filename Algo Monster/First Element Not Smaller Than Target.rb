require 'pry'

def first_not_smaller(arr, target)
  left = 0
  right = arr.length - 1
  result = -1

  while left <= right
    mid = (left + right) / 2

    if arr[mid] >= target
      result = mid
      right = mid - 1
    else
      left = mid + 1
    end
  end

  result
end

arr = [1, 3, 3, 5, 8, 8, 10]
target = 2
p first_not_smaller(arr, target) == 1

arr = [2, 3, 5, 7, 11, 13, 17, 19]
target = 6
p first_not_smaller(arr, target) == 3

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
target = 10
p first_not_smaller(arr, target) == 9

arr = [0]
target = 0
p first_not_smaller(arr, target) == 0
