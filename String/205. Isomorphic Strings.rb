require 'pry'

def is_isomorphic(s, t)
  return false if s.length != t.length

  s_chars = s.chars
  t_chars = t.chars
  s_hash = Hash.new(0)
  t_hash = Hash.new(0)

  s.length.times do |i|
    s_hash[s_chars[i]] += 1
    t_hash[t_chars[i]] += 1

    return false if s_hash.length != t_hash.length
    return false if s_hash.values != t_hash.values
  end

  true
end

p is_isomorphic("egg", "add")
p is_isomorphic("foo", "bar")
p is_isomorphic("paper", "title")
p is_isomorphic("bbbaaaba", "aaabbbba")
