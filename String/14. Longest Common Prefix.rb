require 'pry'

def longest_common_prefix(strs)
  return "" if strs.nil? || strs.empty?
  longest = strs.max.length
  result = ""

  longest.times do |i|
    prefixes = strs.map do |str|
      str[i]
    end

    if prefixes.uniq.length == 1
      result << prefixes[0]
    else
      break
    end
  end

  result
end

p longest_common_prefix(["flower","flow","flight"]) == "fl"
p longest_common_prefix(["dog","racecar","car"]) == ""
