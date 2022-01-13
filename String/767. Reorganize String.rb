require 'pry'

# Need to use HEAP for optimal solution
def reorganize_string(s)
  return '' if s.nil? || s.empty?
  return s  if s.length <= 1

  hash = Hash.new
  s.chars.each do |char|
    hash[char] ||= 0
    hash[char] += 1
  end

  result = ''

  while hash.values.flatten.sum >= 1
    trimmed_hash = hash.reject do |k, _|
      k == result[-1]
    end

    pair = trimmed_hash.find do |_k,v|
      v == trimmed_hash.values.max
    end

    return '' if pair.nil?

    result << pair[0]
    hash[pair[0]] -= 1
    if hash[pair[0]] == 0
      hash.delete(pair[0])
    end
  end

  result
end

# p reorganize_string('aab') == 'aba'
# p reorganize_string('aab')
# p reorganize_string('aaab')
# p reorganize_string('aaab')
# p reorganize_string('vvvlo')
p reorganize_string('baaba')
