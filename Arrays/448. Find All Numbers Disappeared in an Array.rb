require 'pry'

def find_disappeared_numbers(nums)
  disappeared = (1..nums.length).to_a
  nums = nums.sort

  d_pointer = 0
  n_pointer = 0

  while n_pointer <= nums.length
    if nums[d_pointer] == disappeared[n_pointer]
      disappeared[d_pointer] = nil
      d_pointer += 1
      n_pointer += 1
    elsif nums[d_pointer] < disappeared[n_pointer]
      n_pointer += 1
    elsif nums[d_pointer] > disappeared[n_pointer]
      d_pointer += 1
    end
  end

  disappeared.compact
end


