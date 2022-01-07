require 'pry'

# Runtime: 112 ms, faster than 100.00% of Ruby online submissions for Valid Palindrome II.
#
# Memory Usage: 213.5 MB, less than 97.18% of Ruby online submissions for Valid Palindrome II.
def valid_palindrome(s)
  left = 0
  right = s.length - 1

  return true if s.length < 1
  return true if s.reverse == s

  while left <= right
    if s[left] != s[right]
      one = s[left+1..right]
      two = s[left..right-1]

      result = [one, two].map do |arr|
         arr.reverse == arr
      end

      return result.any? true
    end

    left += 1
    right -= 1
  end

  true
end

p valid_palindrome('aba') == true
p valid_palindrome('abca') == true
p valid_palindrome('abc') == false
p valid_palindrome('eedede') == true
p valid_palindrome('cxcaac') == false
