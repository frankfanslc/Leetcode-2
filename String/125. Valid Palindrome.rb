require 'pry'

def is_palindrome(s)
  return false if s.nil?
  return true if s.length <= 1

  alphabet = ("a".."z").to_a
  numeric = ("0".."9").to_a
  alphanumeric = alphabet + numeric

  arr = s.downcase.split("")

  phrase = arr.inject("") do |memo, char|
    memo << char if alphanumeric.include? char
    memo
  end

  phrase == phrase.reverse
end

p is_palindrome("A man, a plan, a canal: Panama") == true
p is_palindrome("race a car") == false
p is_palindrome(" ") == true
