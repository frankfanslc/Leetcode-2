require 'pry'

def first_uniq_char(s)
  return -1 if s.nil? or s.empty?

  chars = {}

  s.chars.each_with_index do |char, idx|
    if chars[char].nil?
      chars[char] = idx
    else
      chars[char] = false
    end
  end

  chars.values.find do |char|
    char != false
  end || -1
end

p first_uniq_char("loveleetcode") == 2
