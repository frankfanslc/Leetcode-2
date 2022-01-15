require 'pry'

def next_greater_element(nums1, nums2)
  return StandardError if nums1.nil? || nums1.empty?
  return StandardError if nums2.nil? || nums2.empty?

  result = []

  nums1.each_with_index do |inum, idx|
    nums2.each_with_index do |jnum, jdx|
      next if inum != jnum

      greater = nums2[jdx+1..-1].find do |greater|
        greater > jnum
      end

      if greater
        result << greater
      else
        result << -1
      end

      break
    end
  end

  result
end

nums1 = [4,1,2]
nums2 = [1,3,4,2]
p next_greater_element(nums1, nums2)
