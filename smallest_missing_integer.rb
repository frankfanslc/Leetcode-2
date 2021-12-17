require 'pry'

def get_different_number(arr)
  # can't modify array
  # get min/max and create a range
  #
  # if element in range, remove from range
  # result is first element of range
  #
  #
  range = Array((arr.min..arr.max))

  arr.each do |v|
    if range.include? v
      range.delete v
    end
  end

  range[0]
end

arr = [100]

p get_different_number(arr)
