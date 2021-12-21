require 'pry'

def longest_palindrome(str)
  # [a b b a ]  even
  #  0 1 2 3
  # [a b e b a] odd
  #  0 1 2 3 4
  # start at 0
  #   return yes
  #   return no
  #   = a
  # start at 1
  #   return no
  #   return yes
  #   = abba
  # start at 2
  #   return no
  #   return no
  # start at 3
  #   return no
  #   return no
end

# Takes in a string a starting left/right pointer
# while
# If left == 0 stop
# If right > string.length stop
# If left & right the same?
#   Save left + right positions and save length (r - l + 1)
#   decrement left
#   increment right
#
# return string[left..right]

def longest_palindrome(str)
  longest_substring = ""

  str.chars.each_with_index do |char, idx|
    string1 = expanding_range(str, idx, idx) # odd scenarios
    string2 = expanding_range(str, idx, idx+1) # even scenarios
    current_largest = [string1, string2].max_by(&:length)

    if current_largest.length > longest_substring.length
      longest_substring = current_largest
    end
  end

  longest_substring
end

def expanding_range(str, left, right)
  while left >= 0 && right < str.length && str[left] == str[right] do
    left-=1
    right+=1
  end

  # Revert increment/decrement since
  # we broke while condition and prev
  # iteration was longest palindrome
  str[(left+1..right-1)]
end

p longest_palindrome('babad') == 'bab'
p longest_palindrome('cbbd') == 'bb'
p longest_palindrome('a') == 'a'
p longest_palindrome('ac') == 'a'
p longest_palindrome('abcba') == 'abcba'
p longest_palindrome('racecar') == 'racecar'
