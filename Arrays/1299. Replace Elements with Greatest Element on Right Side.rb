require 'pry'

def replace_elements(arr)
  return StandardError if arr.nil?
  return [-1] if arr.empty? || arr.length == 1

  replaced = arr.each_with_index.map do |num, idx|
    arr[idx+1..-1].max
  end

  replaced[-1] = -1
  replaced
end

# In place solution
def replace_elements(arr)
  return StandardError if arr.nil?
  return [-1] if arr.empty? || arr.length == 1

  left = 0
  right = 1
  length = arr.length - 1
  current_max = 0

  length.times do
    while right <= length
      if arr[right] > current_max
        current_max = arr[right]
      end

      right += 1
    end

    arr[left] = current_max

    # Reset for next element in array
    left += 1
    right = left + 1
    current_max = 0
  end

  arr[-1] = -1
  arr
end

p replace_elements([17,18,5,4,6,1])
