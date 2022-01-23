require 'pry'

def pancake_sort(arr)
  result = []

  while arr.any?
    # 1. Find maximum in array, reverse from it's index
    # 2. Save the index into result
    # 3. Reverse the entire array
    # 4. Save the last element's index into result
    # 5. Pop the last element
    # 6. Repeat steps until no elements remain
    max = arr.max
    idx = arr.index(max) + 1

    result << idx
    result << arr.length

    arr = arr[0..idx-1].reverse + arr[idx..-1]
    arr = arr.reverse
    arr.pop
  end

  result
end

arr = [3,2,4,1]
p pancake_sort(arr) == [4,2,4,3]
p pancake_sort(arr)

# [3,2,4,1]
# [1,4,2,3]
# [4,1,2,3]
# [3,2,1,4]
# [1,2,3,4]



# [3,2,4,1]
# [4,2,3,1]
# [1,3,2,4]
# [3,1,2,4]
# [2,1,3,4]
# [1,2,3,4]

