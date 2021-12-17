
require 'pry'

class Array
  def quicksort(k = nil)
    return [] if empty?

    pivot = delete_at(rand(size))

    left, right = partition do |v|
      pivot > v
    end

    return [left.quicksort, pivot, right.quicksort].flatten
  end
end

arr = [1, 4, 5, 2, 3, 7, 8, 6, 10, 9]
k = 2

p arr.quicksort(k)
