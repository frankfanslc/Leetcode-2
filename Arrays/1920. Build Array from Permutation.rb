require 'pry'

def build_array(nums)
  return StandardError if nums.nil?
  return [] if nums.empty?

  nums.map.with_index do |num, idx|
    nums[nums[idx]]
  end
end

p build_array([0,2,1,5,3,4])
