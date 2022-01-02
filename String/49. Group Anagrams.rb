require 'pry'

# Slow solution using sort comparison
# def group_anagrams(strs)
#   # 1. Each word compare to next word
#   # 2. If anagram remove from array
#   # 3. Restart with next word
#   return [strs] if strs.length <= 1

#   res = []

#   while strs.length > 0
#     group = [strs[0]]

#     strs.each_with_index do |_other_word, j|
#       next if 0 == j

#       if is_anagram?(strs[0], strs[j])
#         group << strs[j]
#       end
#     end

#     group.each do |word|
#       strs.delete(word)
#     end

#     res << group
#   end

#   res
# end

# def is_anagram?(word_one, word_two)
#   return false if word_one.length != word_two.length
#   word_one.chars.sort == word_two.chars.sort
# end


# Fast solution using hash map
def group_anagrams(strs)
  # Loop once
  # Put each string in hash map
  # Return hash map values
  return [strs] if strs.length <= 1

  result = {}

  strs.each do |word|
    key = word.chars.sort.inject({}) do |memo, char|
      memo[char] ? memo[char] += 1 : memo[char] = 1
      memo
    end

    result[key] ? result[key] << word : result[key] = [word]
  end

  result.values
end

strs = ["eat","tea","tan","ate","nat","bat"]
output = [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
p group_anagrams(strs) == output

strs = [""]
output = [[""]]
p group_anagrams(strs) == output

strs = ["a"]
output = [["a"]]
p group_anagrams(strs) == output
