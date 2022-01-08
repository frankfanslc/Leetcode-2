require 'pry'

# Runtime: 48 ms, faster than 100.00% of Ruby online submissions for Verifying an Alien Dictionary.
#
# Memory Usage: 210.1 MB, less than 56.25% of Ruby online submissions for Verifying an Alien Dictionary.
def is_alien_sorted(words, order)
  return false if words.empty? || words.nil?
  return false if order.nil?

  order_map = {}
  order.chars.each_with_index do |letter, idx|
    order_map[letter] = idx + 1
  end

  words.each_with_index do |word, idx|
    return true if idx == words.length - 1 # Last word has no comparison

    word.chars.each_with_index do |char, cidx|
      current_letter  = order_map[char]
      adjacent_letter = order_map[words[idx+1][cidx]]

      next if current_letter == adjacent_letter              # Letters are equal, skip to next
      return false if current_letter && adjacent_letter.nil? # First word is longer
      return false if current_letter > adjacent_letter       # Unsorted case found
      break if current_letter < adjacent_letter              # Sorted case found, go to next pair
    end
  end
end

# words = ["hello","leetcode"]
# order = "hlabcdefgijkmnopqrstuvwxyz"
# p is_alien_sorted(words, order) == true

words = ["word","world","row"]
order = "worldabcefghijkmnpqstuvxyz"
p is_alien_sorted(words, order) == false

words = ["apple","app"]
order = "abcdefghijklmnopqrstuvwxyz"
p is_alien_sorted(words, order) == false
