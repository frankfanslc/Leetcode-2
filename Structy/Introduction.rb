require 'pry'

def greet(s)
  "hey #{s}"
end

p "GREET"
p greet('alvin') == 'hey alvin'
p greet('jason') == 'hey jason'
p greet('how now brown cow') == 'hey how now brown cow'
print "\n\n"

def max_value(nums)
  head = 0
  tail = nums.length - 1
  max = nums[head]

  while head < tail
    max = nums[head] if nums[head] > max
    max = nums[tail] if nums[tail] > max
    head +=1
    tail -=1
  end

  max
end

p "MAX VALUE"
nums = [4, 7, 2, 8, 10, 9]
p max_value(nums) == 10
nums = [10, 5, 40, 40.3]
p max_value(nums) == 40.3
nums = [-5, -2, -1, -11]
p max_value(nums) == -1
nums = [42]
p max_value(nums) == 42
nums = [1000, 8]
p max_value(nums) == 1000
nums = [1000, 8, 9000]
p max_value(nums) == 9000
nums = [2, 5, 1, 1, 4]
p max_value(nums) == 5
print "\n\n"

def is_prime(n)
  range = (2..n-1).to_a

  range.each do |x|
    return false if n % x == 0
  end

  true
end

p "IS PRIME"
p is_prime(2) == true
p is_prime(3) == true
p is_prime(4) == false
p is_prime(5) == true
p is_prime(6) == false
p is_prime(7) == true
print "\n\n"
