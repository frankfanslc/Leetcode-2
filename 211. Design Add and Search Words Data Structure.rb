require 'pry'

class WordDictionary
  attr_accessor :words

  def initialize
    @words = {}
  end

  def add_word(word)
    length = word.chars.length

    @words[length] ||= {}
    @words[length][word] = word
  end

  def search(word)
    return false if @words.empty?

    length = word.chars.length

    if !contain_period?(word)
      return false if @words[length].nil?
      return true if @words[length][word]
      return false
    end

    return true if partial_match?(word)

    false
  end

  private

  def contain_period?(word)
    word.chars.find do |char|
      char == "."
    end
  end

  def partial_match?(word)
    length = word.chars.length

    wildcard_indices = word.chars.each_with_index.map do |char, idx|
      next if char != "."
      idx
    end.compact

    stripped_words = @words[length].values.map do |hash_word|
      chars = hash_word.chars

      wildcard_indices.each do |idx|
        chars[idx] = "."
      end

      chars.join("").gsub(".", "")
    end

    stripped_words.find do |stripped|
      stripped == word.gsub(".", "")
    end
  end
end

wd = WordDictionary.new
# wd.add_word("bad")
# wd.add_word("dad")
wd.add_word("a")
# wd.search("pad")
# wd.search("bad")
# wd.search(".ad")
wd.search(".")
