require 'pry'

class SparseVector

=begin
    :type nums: Integer[]
=end
  def initialize(nums)
    @nums = nums
  end

  # Return the dotProduct of two sparse vectors
=begin
    :type vec: SparseVector
    :rtype: Integer
=end
  def dotProduct(vec)
    vec.nums.each_with_index.inject(0) do |accum, (num, idx)|
      accum = num * @nums[idx]
      accum
    end
  end
end
