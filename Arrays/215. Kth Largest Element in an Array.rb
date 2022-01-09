require 'pry'

# 1 Naive
 def find_kth_largest(nums, k)
   return 0 if nums.empty? || nums.nil?

   nums.sort!
   nums[-k]
 end

#2 Heap
# def find_kth_largest(nums, k)
#   heap = []

#   nums.each do |num|
#     heap << num

#     if heap.length > k
#       min_idx = heap.each_with_index.min[1]
#       heap.delete_at(min_idx)
#     end
#   end

#   heap.min
# end

p find_kth_largest([99,99], 1) == 99
p find_kth_largest([3,2,1,5,6,4], 2) == 5
