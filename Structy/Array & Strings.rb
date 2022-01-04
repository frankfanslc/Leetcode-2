require 'pry'

def uncompress(s)
  groups = []
  string_nums = (0..9).to_a.map(&:to_s)

  s.chars.inject("") do |memo, char|
    if string_nums.include? char
      memo << char
    else
      groups << [memo, char]
      memo = ""
    end

    memo
  end

  groups.inject("") do |memo, group|
    partial = group[1] * group[0].to_i
    memo << partial
    memo
  end
end

p "UNCOMPRESS"
p uncompress("2c3a1t")  == "ccaaat"
p uncompress("4s2b")    == "ssssbb"
p uncompress("2p1o5p")  == "ppoppppp"
p uncompress("3n12e2z") == "nnneeeeeeeeeeeezz"
p uncompress("12y")     == "yyyyyyyyyyyy"
p uncompress("10z")     == "zzzzzzzzzz"
print "\n\n"

def compress(s)
  s += "!"
  groups = []

  s.chars.inject([]) do |memo, char|
    if memo.empty?
      memo[0] = 1
      memo[1] = char
    elsif char == memo[1]
      memo[0] += 1
    elsif char == "!"
      groups << ["#{memo[0]}#{memo[1]}"]
    else
      groups << ["#{memo[0]}#{memo[1]}"]
      memo[0] = 1
      memo[1] = char
    end

    memo
  end

  groups.join("")
end

p "COMPRESS"
p "2c3a1t"  == compress("ccaaat")
p "4s2b"    == compress("ssssbb")
p "2p1o5p"  == compress("ppoppppp")
p "3n12e2z" == compress("nnneeeeeeeeeeeezz")
p "12y"     == compress("yyyyyyyyyyyy")
p "10z"     == compress("zzzzzzzzzz")
print "\n\n"
