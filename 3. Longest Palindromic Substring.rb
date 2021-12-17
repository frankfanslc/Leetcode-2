require 'pry'

def longest_palindrome(str)
  palindromes = []

  str.chars.each_with_index do |char, idx|
    palindromes << char
    substring = char
    next_char_idx = idx

    (str.length - idx).times do
      # stop iteration if at past last element
      break if next_char_idx >= (str.chars.length - 1)

      next_substring = (substring + str.chars[next_char_idx+1])

      if is_palindrome?(next_substring)
        palindromes << next_substring
      end

      substring = next_substring
      next_char_idx+=1
    end
  end

  palindromes.max_by(&:length)
end

def is_palindrome?(str)
  return true if str.length == 1

  left = 0
  right = str.length - 1

  str.length.times do
    return false if (str.chars[left] != str.chars[right])
    return true if (left == right) # odd number of chars

    left += 1
    right -= 1

    true
  end
end

# p is_palindrome?('abcba')
# p is_palindrome?('racecar')
# p is_palindrome?('xywaks')
# p is_palindrome?('a')
# p is_palindrome?('ac')

p longest_palindrome('babad') == 'bab'
p longest_palindrome('cbbd') == 'bb'
p longest_palindrome('a') == 'a'
p longest_palindrome('ac') == 'a'
p longest_palindrome('abcba') == 'abcba'
p longest_palindrome('racecar') == 'racecar'
