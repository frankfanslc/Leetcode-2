require 'pry'

def max_area(heights_array)
  left = 0
  right = heights_array.length - 1
  max_area = 0

  while (right - left) >= 1 do
    area = calculate_max_area(heights_array, left, right)

    if area > max_area
      max_area = area
    end

    if heights_array[left] <= heights_array[right]
      left += 1
    else
      right -= 1
    end
  end

  max_area
end

def calculate_max_area(heights_array, left, right)
  min_height = [heights_array[left], heights_array[right]].min
  distance = right - left

  min_height * distance
end

p max_area([1,2,3,4]) == 4
p max_area([3,2,1,3]) == 9
p max_area([1,2]) == 1
p max_area([1,1]) == 1
p max_area([4,3,2,1,4]) == 16
p max_area([1,2,1]) == 2
