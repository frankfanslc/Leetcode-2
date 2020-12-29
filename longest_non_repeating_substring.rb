require 'pry'

def length_of_longest_substrings(s)
  substring = []

  chars = substring.chars

  chars.each_with_index do |char, idx|
    if substring.exclude? char
      substring << char
    end

    if char == substring[idx+1]

    end

    substring << char
  end

end


p (length_of_longest_substrings("abcabcbb") == 3)
p (length_of_longest_substrings("bbbbb") == 1)
p (length_of_longest_substrings("pwwkew") == 3)
p (length_of_longest_substrings("") == 0)
