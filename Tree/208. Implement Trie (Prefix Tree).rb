require 'pry'

class TrieNode
  attr_accessor :children, :end

  def initialize
    @children = {}
    @end = false
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = root

    word.chars.each do |char|
      if !current.children[char]
        current.children[char] = TrieNode.new
      end

      current = current.children[char]
    end

    current.end = true
  end

  def search(word)
    current = root

    word.chars.each do |char|
      if current.children[char]
        current = current.children[char]
      else
        return false
      end
    end

    current.end
  end

  def starts_with(prefix)
    current = root

    prefix.chars.each do |char|
      if current.children[char]
        current = current.children[char]
      else
        return false
      end
    end

    true
  end
end
