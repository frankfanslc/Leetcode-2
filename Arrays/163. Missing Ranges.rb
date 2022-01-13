require 'pry'

# x not in nums is missing
def find_missing_ranges(nums, lower, upper)
  return [] if nums.first == lower && lower == upper && nums.length == 1
  return [lower.to_s] if nums.empty? && lower == upper
  return [lower.to_s] if nums.empty? && upper - lower <= 1
  return ["#{lower}->#{upper}"] if nums.empty?

  length = nums.length - 1
  nums.each_with_index.map do |num, idx|
    unless idx == length
      next if nums[idx+1] - num <= 1
    end

    lower_range = idx == 0 ? lower : num + 1
    upper_range = idx == length ? upper : nums[idx+1] - 1

    if lower_range == upper_range || (upper_range - lower_range).abs <= 1
      lower_range.to_s
    else
      "#{lower_range}->#{upper_range}"
    end
  end.compact
end

def find_missing_ranges(nums, lower, upper)
  nums << upper + 1
  nums.size.times do |i|
    if lower == nums[i]
      nums[i] = nil
    else
      lower, nums[i] = nums[i], format(lower, nums[i] - 1)
    end
    lower += 1
  end

  nums.compact
end

def format(lower, upper)
  return lower.to_s if lower == upper
  "#{lower}->#{upper}"
end

nums = [0,1,3,50,75]
lower = 0
upper = 99
output = ["2","4->49","51->74","76->99"]
p find_missing_ranges(nums, lower, upper) == output
