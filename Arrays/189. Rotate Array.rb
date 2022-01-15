require 'pry'

def rotate(nums, k)
  return StandardError if nums.nil? || k.nil?

  k.times do
    nums.prepend(nums[-1])
    nums.pop
  end
end
