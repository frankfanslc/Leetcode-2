require 'pry'

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))

    left, right = partition do |v|
      pivot[0] > v[0]
    end

    return *left.quicksort, pivot, *right.quicksort
  end
end

def find_schedule_conflicts(arr)
  conflicts = arr.each_with_index.map do |appt, idx|
    next_appt = arr[idx+1]
    next if next_appt.nil?

    range = ((appt[0]+1)..(appt[1]-1))

    if range.include?(next_appt[0]) || range.include?(next_appt[1])
      [appt, next_appt]
    end
  end

  conflicts.compact.flatten(1).uniq.quicksort
end



unsorted = [[7,8], [2,3], [1,2], [3,5], [4,6], [5,8], [6,9], [10,11]]

p find_schedule_conflicts(unsorted.quicksort)
