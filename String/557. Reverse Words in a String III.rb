require 'pry'

def reverse_words(s)
  return "" if s.nil?

  stack = []
  words = s.split(" ")

  words.map do |word|
    word.chars.each do |char|
      stack << char
    end

    reversed_word = ""

    while stack.any?
      reversed_word << stack.pop
    end

    reversed_word
  end.join(" ")
end

s = "Let's take LeetCode contest"
p reverse_words(s)
