require 'pry'

def can_permute_palindrome(s)
  return StandardError if s.nil?

  hash = {}
  s.chars.each do |char|
    hash[char] ||= 0
    hash[char] += 1

    if hash[char] == 2
      hash.delete(char)
    end
  end

  hash.keys.count <= 1
end

p can_permute_palindrome('code') == false
p can_permute_palindrome('aab') == true
p can_permute_palindrome('carerac') == true
