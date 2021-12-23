require 'pry'

def is_anagram(s, t)
  return false if s.length != t.length
  return true if s.empty? && t.empty?

  hash = Hash.new(0)

  s.each_char { |char| hash[char] += 1 }

  t.each_char do |char|
    if hash[char]
      hash[char] -= 1
    else
      return false
    end
  end

  return hash.all? { |k,v| v == 0 }
end

p is_anagram("anagram", "nagaram") == true
p is_anagram("rat", "car") == false
p is_anagram("ab", "a") == false
