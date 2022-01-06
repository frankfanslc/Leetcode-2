require 'pry'

def is_palindrome(x)
  return false if x.nil? || x.negative?

  digits = x.digits

  return true if digits.length == 1

  left = 0
  right = digits.length - 1

  while left < right
    return false if digits[left] != digits[right]

    left += 1
    right -= 1
  end

  true
end

p is_palindrome(121) == true
p is_palindrome(-121) == false
p is_palindrome(10) == false

