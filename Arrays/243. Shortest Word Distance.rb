require 'pry'

def shortest_distance(words, word1, word2)
  return -1 if words.empty?

  word1_idx = nil
  word2_idx = nil
  min_distance = Float::INFINITY

  words.each_with_index do |word, idx|
    if word == word1
      word1_idx = idx

      if word1_idx && word2_idx
        distance = (word1_idx - word2_idx).abs
        min_distance = [min_distance, distance].min
      end
    end

    if word == word2
      word2_idx = idx

      if word1_idx && word2_idx
        distance = (word2_idx - word1_idx).abs
        min_distance = [min_distance, distance].min
      end
    end
  end

  return -1 if min_distance == Float::INFINITY

  min_distance
end

words_dict = ["practice", "practice", "makes", "perfect", "coding", "makes"]
p shortest_distance(words_dict, 'coding', 'practice') == 3

words_dict = ["practice", "practice", "makes", "perfect", "leet", "makes", "coding"]
p shortest_distance(words_dict, 'coding', 'practice') == 5

words_dict = ["practice", "practice", "coding", "perfect", "leet", "makes", "coding"]
p shortest_distance(words_dict, 'coding', 'practice') == 1

words_dict = ["practice", "practice", "coding", "perfect", "leet", "makes", "coding"]
p shortest_distance(words_dict, 'coding', 'sike') == -1
