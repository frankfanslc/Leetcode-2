require 'pry'
require 'set'

def three_sum(nums)
  return [] if nums.empty?
  return [] if nums.length <= 2

  sorted = nums.sort
  triplets = []

  # 1. We iterate through the entire sorted array
  # 2. Left and Right is idx + 1 and end of array
  # 3. If triplets are LESS than 0, we move left
  #    to the right to INCREASE sum
  # 4. If triplets are GREATER than 0, we move right
  #    to the left to DECREASE sum
  # 5. Save and triplets that result in 0
  # 6. Continue with while loop and then continue
  #    with each interation
  # 7. Ensure results are sorted + uniq

  sorted.each_with_index do |num, idx|
    # Important to skip next iteration if
    # it is the same as previous number unless
    # it is the first iteration
    next if num == sorted[idx-1] && idx != 0

    left = idx + 1
    right = nums.length - 1


    while left < right do
      sum = num + sorted[left] + sorted[right]

      if sum == 0
        triplets << [num, sorted[left], sorted[right]].sort
        left += 1
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end

  triplets.uniq!
  triplets
end



p three_sum([-1,0,1,2,-1,-4]) == [[-1,-1,2], [-1,0,1]]
p three_sum([0,0,0]) == [[0,0,0]]
p three_sum([-1,0,1]) == [[-1,0,1]]
p three_sum([3,-2,1,0]) == []
p three_sum([]) == []
p three_sum([0]) == []
