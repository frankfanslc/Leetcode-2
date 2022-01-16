require 'pry'

def find_kth_positive(arr, k)
  max = [arr[-1], k].max
  range = (1..max+k).to_a

  arr.each do |num|
    range.delete(num)
  end

  range[k-1]
end

arr = [2, 3, 4, 7, 11]
k = 5
p find_kth_positive(arr, k) == 9

arr = [1, 2, 3, 4]
k = 2
p find_kth_positive(arr, k) == 6
