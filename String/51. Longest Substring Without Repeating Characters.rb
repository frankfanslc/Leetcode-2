require 'pry'

def length_of_longest_substring(str)
  # 1. Iterate through string
  # 2. Each iteration, increment to next letter until repeat is found
  # 3. Save substring if current substring is less than
  # 4. Can there be two answers?

  chars = str.chars
  substring_lengths = [0]

  chars.each_with_index do |char, idx|
    chars_used = Hash.new
    chars_used[char] = idx
    next_char_idx = idx += 1

    while !chars_used.key? chars[next_char_idx] do
      break if chars[next_char_idx].nil?

      chars_used[chars[next_char_idx]] = next_char_idx

      next_char_idx += 1
    end

    substring_lengths << chars_used.keys.count
  end

  substring_lengths.uniq.max
end

p length_of_longest_substring('abcabcbb') == 3
p length_of_longest_substring('bbbbb') == 1
p length_of_longest_substring('pwpwpppeeascaser') == 5
p length_of_longest_substring('pwwkew') == 3
