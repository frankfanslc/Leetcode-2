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

def anagrams(s1, s2)
  return false if s1.length != s2.length

  s1.chars.sort == s2.chars.sort
end


# O(m + n)
def anagrams(s1, s2)
  return false if s1.length != s2.length

  s1_freq = s1.chars.inject({}) do |memo, char|
    memo[char] ||= 0
    memo[char] += 1
    memo
  end

  s2.chars.each do |char|
    return false if s1_freq[char].nil?

    if s1_freq[char] == 1
      s1_freq.delete(char)
    else
      s1_freq[char] -= 1
    end
  end

  s1_freq.values.empty?
end

p "ANAGRAMS"
p anagrams("restful",      "fluster")      == true
p anagrams("cats",         "tocs")         == false
p anagrams("monkeyswrite", "newyorktimes") == true
p anagrams("paper",        "reapa")        == false
p anagrams("elbow",        "below")        == true
p anagrams("tax",          "taxi")         == false
p anagrams("taxi",         "tax")          == false
print "\n\n"


# O(n)
def most_frequent_char(s)
  return "" if s.nil?

  most_frequent = 0
  char_freq = s.chars.each_with_index.inject({}) do |memo, (char, idx)|
    memo[char] ||= [0,idx]
    memo[char][0] += 1

    if memo[char][0] > most_frequent
      most_frequent = memo[char][0]
    end

    memo
  end

  char_freq.select do |k,v|
    v[0] == most_frequent
  end.min_by do |k,v|
    v[1]
  end[0]
end

p "MOST FREQ CHAR"
p most_frequent_char("bookeeper")     == "e"
p most_frequent_char("david")         == "d"
p most_frequent_char("abby")          == "b"
p most_frequent_char("mississippi")   == "i"
p most_frequent_char("potato")        == "o"
p most_frequent_char("eleventennine") == "e"
p most_frequent_char("riverbed")      == "r"
print "\n\n"


# O(n)
def pair_sum(numbers, target_sum)
  return StandardError if numbers.nil? or numbers.empty?
  return StandardError if target_sum.nil?

  numbers.each_with_index.inject({}) do |memo, (num, idx)|
    complement = target_sum - num

    if memo[complement]
      return [memo[complement], idx]
    end

    memo[num] ||= []
    memo[num] = idx
    memo
  end
end

p "PAIR SUM"
p pair_sum([3, 2, 5, 4, 1], 8)    == [0, 2]
p pair_sum([4, 7, 9, 2, 5, 1], 5) == [0, 5]
p pair_sum([4, 7, 9, 2, 5, 1], 3) == [3, 5]
p pair_sum([1, 6, 7, 2], 13)      == [1, 2]
p pair_sum([9, 9], 18)            == [0, 1]
p pair_sum([6, 4, 2, 8 ], 12)     == [1, 3]
print "\n\n"


# O(n)
def pair_product(numbers, target_product)
  return StandardError if numbers.nil? or numbers.empty?
  return StandardError if target_product.nil?

  numbers.each_with_index.inject({}) do |memo, (num, idx)|
    complement = target_product / num

    if memo[complement]
      return [memo[complement], idx]
    end

    memo[num] ||= []
    memo[num] = idx
    memo
  end
end

p "PAIR PRODUCT"
p pair_product([3, 2, 5, 4, 1], 8)     == [1, 3]
p pair_product([3, 2, 5, 4, 1], 10)    == [1, 2]
p pair_product([4, 7, 9, 2, 5, 1], 5)  == [4, 5]
p pair_product([4, 7, 9, 2, 5, 1], 35) == [1, 4]
p pair_product([3, 2, 5, 4, 1], 10)    == [1, 2]
p pair_product([4, 6, 8, 2], 16)       == [2, 3]
print "\n\n"


# O(n + 2 Log m) Time
# O(min(m,n) Space
def intersection(a, b)
  return StandardError if a.nil? || b.nil?
  return [] if a.empty? || b.empty?

  intersections = []
  b.sort!

  a.each do |num|
    left = 0
    right = b.length - 1

    while left <= right
      mid = (right + left) / 2

      if b[mid] == num
        intersections << num
        break
      end

      if b[mid] > num
        right = mid - 1
      else
        left = mid + 1
      end
    end
  end

  intersections.sort
end

p "INTERSECTIONS"
p intersection([4,2,1,6], [3,6,9,2,10]) == [2,6]
p intersection([2,4,6],   [4,2])        == [2,4]
p intersection([4,2,1],   [1,2,4,6])    == [1,2,4]
p intersection([0,1,2],   [10,11])      == []
a = (0..50_000).to_a
b = (0..50_000).to_a
p intersection(a, b) == a






































