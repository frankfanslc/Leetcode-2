require 'pry'

def unique_morse_representations(words)
  return 0 if words.empty? || words.nil?

  morse = [
    ".-", "-...", "-.-.", "-..", ".",
    "..-.", "--.", "....", "..", ".---",
    "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-",
    "..-", "...-", ".--", "-..-", "-.--",
    "--.."
  ]

  alphabet = ("a".."z").to_a.each_with_index.inject({}) do |memo, (letter, idx)|
    memo[letter] = morse[idx]
    memo
  end

  words.map do |word|
    word.chars.map do |char|
      alphabet[char]
    end.join("")
  end.uniq.count
end

words = ["gin","zen","gig","msg"]
p unique_morse_representations(words) == 2
