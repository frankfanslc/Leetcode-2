require 'pry'

def group_strings(strings)
  return [] if strings.empty? || strings.nil?
  return [strings] if strings.length == 1

  sequences = Hash.new { |h,k| h[k] = [] }
  alphabet = {}
  ("a".."z").to_a.each_with_index do |letter, idx|
    alphabet[letter] = idx + 1
  end

  strings.each do |string|
    res = string.chars.map do |char|
      alphabet[char]
    end

    sequence = res.map do |int|
      int = int - res[0] + 1

      if int < 1
        int += 26
      end

      int.abs
    end

    sequences[sequence] << string
  end

  binding.pry
  sequences.values
end

strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
output = [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
p group_strings(strings) == output

strings = ["ab","ba"]
output = [["ba"],["ab"]]
p group_strings(strings) == output
