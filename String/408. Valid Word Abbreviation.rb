require 'pry'

def valid_word_abbreviation(word, abbr)
  alphabet = ("a".."z").to_a
  chars = word.chars
  digits = ""
  splits = []

  abbr.chars.each do |char|
    if alphabet.include? char
      splits << "*" * digits.to_i if !digits.empty?
      splits << char
      digits = ""
    else
      digits << char
    end

    return false if digits[0] == "0"
    return false if digits.to_i > chars.length
  end

  if !digits.empty?
    splits << "*" * digits.to_i
  end

  return false if splits.join("").length != word.length

  splits.join("").chars.each_with_index do |split_char, idx|
    next if split_char == "*"
    return false if split_char != chars[idx]
  end

  true
end

p valid_word_abbreviation("internationalization", "i12iz4n") == true
p valid_word_abbreviation("internationalization", "i5a11o1") == true
p valid_word_abbreviation("a", "01") == false
p valid_word_abbreviation("word", "3e") == false
