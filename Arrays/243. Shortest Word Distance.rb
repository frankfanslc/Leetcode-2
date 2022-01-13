require 'pry'

def shortest_distance(words_dict, word1, word2)
  return StandardError if words_dict.nil? || words_dict.empty?
  return StandardError if word1.nil? || word2.nil?

  hash = Hash.new
  words_dict.each_with_index do |word, idx|
    if word == word1 or word == word2
      hash[word] ||= []
      hash[word] << idx
    end
  end

  shortest_distance = hash.values.flatten.max
  hash.values[0].each do |word1|
    hash.values[1].each do |word2|
      distance1 = word1 - word2
      distance2 = word2 - word1

      if distance1 > 0 && distance1 < shortest_distance
        shortest_distance = distance1
      end

      if distance2 > 0 && distance2 < shortest_distance
        shortest_distance = distance2
      end
    end
  end

  shortest_distance
end

words_dict = ["practice", "practice", "makes", "perfect", "coding", "makes"]
output = 3
p shortest_distance(words_dict, 'coding', 'practice')
