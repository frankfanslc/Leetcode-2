require 'pry'

# Non priority queue approach
def top_k_frequent(words, k)
  return [] if words.empty? || words.nil?
  return words if k <= 0
  return StandardError if k.nil?

  words.inject({}) do |freq, word|
    freq[word] ||= 0
    freq[word] += 1
    freq
  end.sort_by do |k,v|
    [-v, -k]
  end[0..k-1].map(&:first)
end

words = ["i","love","leetcode","i","love","coding"]
p top_k_frequent(words, 2) == ["i", "love"]
